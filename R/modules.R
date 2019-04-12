# global reference to tsfresh (will be initialized in .onLoad)
tsfresh <- NULL

.onLoad <- function(libname, pkgname) {
  tsfresh <<- reticulate::import("tsfresh", delay_load = TRUE)
}
