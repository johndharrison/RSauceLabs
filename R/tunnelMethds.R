## tunnelMethds.R - compiled by RoxygenReady, a package by @vertesy


#' getTunnels 
#' 
#' getTunnels <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples getTunnels (account =  , ... =  )
#' @export 

getTunnels <-function (account, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/:username/tunnels", data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getTunnels", json = body, ...)
}


#' getTunnel 
#' 
#' getTunnel <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples getTunnel (account =  , ... =  )
#' @export 

getTunnel <-function (account, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/:username/tunnels/:tunnel_id", data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getTunnel", json = body, ...)
}


#' deleteTunnel 
#' 
#' deleteTunnel <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples deleteTunnel (account =  , ... =  )
#' @export 

deleteTunnel <-function (account, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/:username/tunnels/:tunnel_id", data = obj)
	res <- queryAPI(verb = DELETE, url = build_url(pathURL), source = "deleteTunnel", json = body, ...)
}


