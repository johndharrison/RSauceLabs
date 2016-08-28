#' @importFrom  httr GET
#' @importFrom  httr POST
#' @importFrom  httr DELETE
#' @importFrom  httr content
#' @importFrom  xml2 read_html
#' @importFrom  jsonlite toJSON
#' @importFrom  jsonlite fromJSON
#' @importFrom  jsonlite base64_dec
#' @importFrom  whisker whisker.render
NULL

#' Create an account object
#'
#' Creates a wrapper around the httr \code{\link{aunthenticate}} function. Adds an "account" class.
#' @param user The SauceLabs user. By default an environmental variable "SLUSER" is looked for.
#' @param password The SauceLabs password for user. By default an environmental variable "SLPASS" is looked for.
#'
#' @return returns an object of class "account".
#' @export
#'
#' @examples
#' \dontrun{
#' }

account <- function(user = Sys.getenv("SLUSER"), password = Sys.getenv("SLPASS")){
  acc <- authenticate(user = user, password = password)
  class(acc) <- c(class(acc), "account")
  acc
}


#' Send a query to SauceLabs.
#'
#' \code{queryAPI} A function to send a query to SauceLabs. Intended for seleniumPipes
#'    internal use mainly.
#' @param verb The http method to use. See \code{\link{VERB}}
#' @param url The url of the remote server endpoint.
#' @param source The name of the RSauceLabs function that called queryDriver.
#' @param ...
#'
#' @return The contents of the response from the remote server. See \code{\link{content}} for details.
#' @export
#'
#' @examples
#' \dontrun{
#' }
queryAPI <- function(verb = GET, account, url, source, ...){
  on.exit(reset_config())
  set_config(account)
  res <- if(!is.null(list(...)[["body"]])){
    verb(url = url, add_headers ("Content-Type" = "application/json"), ...)
  }else{
    verb(url = url, ...)
  }
  # Add error checking code here
  checkSLRes(res)
  res <- content(res)
  res
}

checkSLRes <- function(response){
  if(identical(response$status_code, 200L)) return()
}
