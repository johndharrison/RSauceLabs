## tempStorageMethods.R - compiled by RoxygenReady, a package by @vertesy


#' uploadFile 
#' 
#' uploadFile <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples uploadFile (account =  , ... =  )
#' @export 

uploadFile <-function (account, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/storage/{{username}}/{{your_file_name}}", 
		data = obj)
	res <- queryAPI(verb = POST, url = build_url(pathURL), source = "uploadFile", json = body, ...)
}


#' getStoredFiles 
#' 
#' getStoredFiles <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples getStoredFiles (account =  , ... =  )
#' @export 

getStoredFiles <-function (account, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/storage/{{username}}", data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getStoredFiles", json = body, ...)
}


