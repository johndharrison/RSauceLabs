## actUsageMethods.R - compiled by RoxygenReady, a package by @vertesy


#' Get Real-Time Job Activity
#'
#' Get information about concurrency, minutes and jobs used by the user over a specific duration (default 90 days). Concurrency is separated in mean and peak concurrency.
#' @template account
#' @param username SauceLabs username
#' @template ellipsis
#' @examples getRealTimeJobActivity (account =  , ... =  )
#' @export

getRealTimeJobActivity <-function (account, username = Sys.getenv("SLUSER"), ...) {
	obj <- list()
	obj$username = username
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1.1/users/{{username}}/concurrency",
		data = obj)
	pathURL <- parse_url(pathTemplate)
	res <- queryAPI(verb = GET, account = account, url = build_url(pathURL), source = "getRealTimeJobActivity", ...)
	res
}


#' Get User Activity
#'
#' Get currently running job counts broken down by account and job status.
#' @template account
#' @param username SauceLabs username
#' @template ellipsis
#' @examples getUserActivity (account =  , ... =  )
#' @export

getUserActivity <-function (account, username = Sys.getenv("SLUSER"), ...) {
	obj <- list()
	obj$username = username
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/{{username}}/activity", data = obj)
	pathURL <- parse_url(pathTemplate)
	res <- queryAPI(verb = GET, account = account, url = build_url(pathURL), source = "getUserActivity", ...)
	res
}


#' Get User Account Usage
#'
#' Access historical account usage data
#' @template account
#' @param username SauceLabs username
#' @template ellipsis
#' @examples getUserAccountUsage (account =  , ... =  )
#' @export

getUserAccountUsage <-function (account, username = Sys.getenv("SLUSER"), ...) {
	obj <- list()
	obj$username = username
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/users/{{username}}/usage", data = obj)
	pathURL <- parse_url(pathTemplate)
	res <- queryAPI(verb = GET, account = account, url = build_url(pathURL), source = "getUserAccountUsage", ...)
	res
}


