## jsUnitTestMethods.R - compiled by RoxygenReady, a package by @vertesy


#' startJsUnitTests 
#' 
#' startJsUnitTests <- function(account, platforms, url, framework, ...){
#' @param account 
#' @param platforms 
#' @param url 
#' @param framework 
#' @param ... 
#' @examples startJsUnitTests (account =  , platforms =  , url =  , framework =  , ... =  )
#' @export 

startJsUnitTests <-function (account, platforms, url, framework, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/{{username}}/js-tests", data = obj)
	res <- queryAPI(verb = POST, url = build_url(pathURL), source = "startJsUnitTests", json = body, 
		...)
}


#' getJsUnitTestStatus 
#' 
#' getJsUnitTestStatus <- function(account, js_tests, ...){
#' @param account 
#' @param js_tests 
#' @param ... 
#' @examples getJsUnitTestStatus (account =  , js_tests =  , ... =  )
#' @export 

getJsUnitTestStatus <-function (account, js_tests, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/{{username}}/js-tests/status", data = obj)
	res <- queryAPI(verb = POST, url = build_url(pathURL), source = "getJsUnitTestStatus", json = body, 
		...)
}


