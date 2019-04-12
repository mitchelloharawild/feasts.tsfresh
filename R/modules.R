# global reference to tsfresh (will be initialized in .onLoad)
tsfresh <- NULL

.onLoad <- function(libname, pkgname) {
  tsfresh <<- reticulate::import("tsfresh", delay_load = TRUE)

  if(!reticulate::py_module_available("tsfresh")){
    packageStartupMessage("tsfresh has not yet been installed. Run `install_tsfresh()` to get started.")
  }
}
