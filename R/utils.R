tsfresh_available <- function(){
  if(!reticulate::py_module_available("tsfresh")){
    stop("tsfresh has not yet been installed. Run `install_tsfresh()` to get started.")
  }
}
