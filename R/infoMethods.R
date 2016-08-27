## infoMethods.R - compiled by RoxygenReady, a package by @vertesy


#' Get Sauce Labs Status
#'
#' Get the current status of Sauce Labs services
#' @template account
#' @template ellipsis
#' @examples getSauceLabsStatus (account =  , ... =  )
#' @export

getSauceLabsStatus <-function (account, ...) {
	obj <- list()
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/info/status", data = obj)
	pathURL <- parse_url(pathTemplate)
	res <- queryAPI(verb = GET, account = account, url = build_url(pathURL), source = "getSauceLabsStatus", ...)
	res
}


#' Get Supported Platforms
#'
#' Get a list of objects describing all the OS and browser platforms currently supported on Sauce Labs. Choose the automation API you need, bearing in mind that WebDriver and Selenium RC are each compatible with a different set of platforms.
#' @template account
#' @param autoAPI Accepted Values for autoAPI "all", "appium", "webdriver". Defaults to "webdriver"
#' @template ellipsis
#' @examples getSupportedPlatforms (account =  , ... =  )
#' @export

getSupportedPlatforms <-function (account, autoAPI = "webdriver", ...) {
  obj <- list()
  obj$automation_api <- autoAPI
  pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/info/platforms/{{automation_api}}",
		data = obj)
	pathURL <- parse_url(pathTemplate)
	res <- queryAPI(verb = GET, account = account, url = build_url(pathURL), source = "getSupportedPlatforms",
		json = body, ...)
	rbindlist(res, fill = TRUE)
}


#' getAppiumEolDates
#'
#' getAppiumEolDates <- function(account, ...){
#' @template account
#' @param username SauceLabs username
#' @template ellipsis
#' @examples getAppiumEolDates (account =  , ... =  )
#' @export

getAppiumEolDates <-function (account, ...) {
	obj <- list()
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/info/platforms/appium/eol", data = obj)
	pathURL <- parse_url(pathTemplate)
	res <- queryAPI(verb = GET, account = account, url = build_url(pathURL), source = "getAppiumEolDates",
		json = body, ...)
	lapply(res, function(x){
	  if(!is.null(x)){
	    as.POSIXct(x, origin="1970-01-01")
	  }else{
	    NA
	  }
	})
}


