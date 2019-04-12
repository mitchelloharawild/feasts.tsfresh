#' Extract tsfresh features
#'
#' @param x A vector (must be sorted in time order)
#'
#' @export
tsfresh_features <- function(x){
  tsfresh_available()
  tsfresh$extract_features(data.frame(x = x, grp = "Unused"), column_id = "grp",
                           column_value = "x", disable_progressbar = TRUE)
}
