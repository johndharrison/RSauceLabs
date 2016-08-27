#' Create an account object
#'
#' Creates a wrapper around the httr \code{\link{aunthenticate}} function. Adds an "account" class.
#' @param user The SauceLabs user. By default an environmental variable "SLUSER" is looked for.
#' @param password The SauceLabs password for user. By default an environmental variable "SLPASS" is looked for.
#'
#' @return
#' @export
#'
#' @examples

account <- function(user = Sys.getenv("SLUSER"), password = Sys.getenv("SLPASS")){
  acc <- authenticate(user = user, password = password)
  class(acc) <- c(class(acc), "account")
}
