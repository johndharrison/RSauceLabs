#' Start JS Unit Tests
#'
#' Start your JavaScript unit tests on as many browsers as you like with a single request
#' @template account
#' @param username SauceLabs username
#' @param platforms A list of platforms (see example)
#' @param url should point to the page that hosts your tests
#' @param framework can be "qunit", "jasmine", "YUI Test", "mocha", or "custom"
#' @template ellipsis
#' @examples startJsUnitTests (account =  , platforms =  , url =  , framework =  , ... =  )
#' @export

startJsUnitTests <-function (account, username = Sys.getenv("SLUSER"), platforms, url, framework, ...) {
	obj <- list()
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/{{username}}/js-tests", data = obj)
	pathURL <- parse_url(pathTemplate)
	res <- queryAPI(verb = POST, account = account, url = build_url(pathURL), source = "startJsUnitTests",
		json = body, ...)
	res
}


#' Get JS Unit Test Status
#'
#' Get the status of your JS unit tests
#' @template account
#' @param username SauceLabs username
#' @param jsTests a vector of job ids.
#' @template ellipsis
#' @examples getJsUnitTestStatus (account =  , js_tests =  , ... =  )
#' @export

getJsUnitTestStatus <-function (account, username = Sys.getenv("SLUSER"), js_tests, ...) {
	obj <- list()
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/{{username}}/js-tests/status", data = obj)
	pathURL <- parse_url(pathTemplate)
	res <- queryAPI(verb = POST, account = account, url = build_url(pathURL), source = "getJsUnitTestStatus",
		json = body, ...)
	res
}


