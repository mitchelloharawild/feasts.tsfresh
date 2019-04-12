library(purrr)
library(rlang)
library(reticulate)
tsfresh <- reticulate::import("tsfresh")

convert_math <- function(x){
  # Inline math
  pos <- gregexpr(":math:`.+?`", x)
  regmatches(x, pos) <- map(regmatches(x, pos), ~ paste0("\\eqn{", map_chr(.x, ~  gsub(":math:|`", "", .x)), "}"))

  # Block math
  pos <- gregexpr("\\.\\. math::\\s*.+?\\n\\n", x)
  regmatches(x, pos) <- map(regmatches(x, pos), ~ paste0("\\deqn{", map_chr(.x, ~  gsub("\\.\\. math::\\s*|\\n", "", .x)), "}\n\n"))

  x
}

convert_param <- function(x){
  # Convert type
  pos <- gregexpr(":type.*\n+?", x)
  regmatches(x, pos) <- map(regmatches(x, pos), ~ paste0("(type: ", map_chr(.x, ~  gsub(":type.+?:|\n$", "", .x)), ")\n"))

  # Convert @param
  pos <- gregexpr(":param.+?:", x)
  regmatches(x, pos) <- map(regmatches(x, pos), ~ paste0("@param ", map_chr(.x, ~  gsub(":param |:$", "", .x))))

  x
}

convert_return <- function(x){
  # Convert type
  pos <- gregexpr("(:rtype:|:return type:).*\n+?", x)
  regmatches(x, pos) <- map(regmatches(x, pos), ~ paste0("(type: ", map_chr(.x, ~  gsub("(:rtype:|:return type:)|\n$", "", .x)), ")\n"))

  # Convert @return
  x <- gsub(":return.*?:", "@return", x)

  x
}

convert_docs <- function(x){
  x <- convert_math(x)
  x <- convert_param(x)
  x <- convert_return(x)

  # Remove function type
  x <- sub("\\*This function is of type: .+?\\n", "", x)

  # Convert references
  x <- sub("\\.\\. rubric:: References", "@references", x)

  # Convert pandas.Series type
  x <- gsub("pandas\\.Series", "numeric vector", x)

  # Add title
  x <- paste0("#' ", stringr::str_to_sentence(gsub("_", " ", names(x))), "\n\n", x)

  # Add export
  x <- paste0(x, "\n\n @export")

  # Fix usage of []
  x <- gsub("\\[", "\\\\[", x)
  x <- gsub("\\]", "\\\\]", x)

  # Trim ws
  x <- gsub("\n +", "\n", x)

  # Add roxygen comments
  x <- gsub("\n", "\n#' ", x)

  x
}

make_functions <- function(x, docs){
  # Extract params
  pos <- gregexpr("@param .+? ", docs)
  params <- map(regmatches(docs, pos), ~ paste0(trimws(gsub("@param", "", .x)), collapse = ", "))

  glue::glue(.open = "{<", .close = ">}",
"

{<docs>}
{<names(x)>} <- function({<params>}){
  tsfresh_available()
  out <- tsfresh$feature_extraction$feature_calculators${<names(x)>}({<params>})
  `names<-`(out, '{<names(x)>}')
}
")
}

features <- names(tsfresh$feature_extraction$feature_calculators) %>%
  map(~ eval(parse_expr(paste0("tsfresh$feature_extraction$feature_calculators$", .x))))
is_feature <- map_lgl(features, ~ possibly(grepl, FALSE)("feature_calculators\\.py", .x$func_code$co_filename))
features <- features[is_feature]

features <- set_names(features, map_chr(features, "func_name"))

features_doc <- map_chr(features, "func_doc")

docs <- convert_docs(features_doc)

writeLines(make_functions(features, docs), "R/features.R")
