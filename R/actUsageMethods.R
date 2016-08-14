## actUsageMethods.R - compiled by RoxygenReady, a package by @vertesy


#' getRealTimeJobActivity 
#' 
#' getRealTimeJobActivity <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples getRealTimeJobActivity (account =  , ... =  )
#' @export 

getRealTimeJobActivity <-function (account, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1.1/users/{{username}}/concurrency", 
		data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getRealTimeJobActivity", json = body, 
		...)
}


#' getUserActivity 
#' 
#' getUserActivity <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples getUserActivity (account =  , ... =  )
#' @export 

getUserActivity <-function (account, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/{{username}}/activity", data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getUserActivity", json = body, ...)
}


#' getUserAccountUsage 
#' 
#' getUserAccountUsage <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples getUserAccountUsage (account =  , ... =  )
#' @export 

getUserAccountUsage <-function (account, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/users/{{username}}/usage", data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getUserAccountUsage", json = body, 
		...)
}


