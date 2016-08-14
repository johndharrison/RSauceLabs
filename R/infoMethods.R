## infoMethods.R - compiled by RoxygenReady, a package by @vertesy


#' getSauceLabsStatus 
#' 
#' getSauceLabsStatus <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples getSauceLabsStatus (account =  , ... =  )
#' @export 

getSauceLabsStatus <-function (account, ...) {
	pathTemplate <- whisker.render("info/status", data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getSauceLabsStatus", json = body, 
		...)
}


#' getSupportedPlatforms 
#' 
#' getSupportedPlatforms <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples getSupportedPlatforms (account =  , ... =  )
#' @export 

getSupportedPlatforms <-function (account, ...) {
	pathTemplate <- whisker.render("info/platforms/:automation_apiAccepted Values for automation_api allappiumwebdriver ", 
		data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getSupportedPlatforms", json = body, 
		...)
}


#' getAppiumEolDates 
#' 
#' getAppiumEolDates <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples getAppiumEolDates (account =  , ... =  )
#' @export 

getAppiumEolDates <-function (account, ...) {
	pathTemplate <- whisker.render("info/platforms/appium/eol", data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getAppiumEolDates", json = body, 
		...)
}


