#' @export
print.account <- function(x, ...){
  cat("Sauce Labs Account:\n")
  cat("SauceLabs username:", strsplit(x$options$userpwd, ":")[[1]], "\n")
}
