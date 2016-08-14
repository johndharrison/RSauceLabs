## accountMethods.R - compiled by RoxygenReady, a package by @vertesy


#' getUser 
#' 
#' getUser <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples getUser (account =  , ... =  )
#' @export 

getUser <-function (account, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/users/{{username}}", data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getUser", json = body, ...)
}


#' createUser 
#' 
#' createUser <- function(account, username, password, name, email, ...){
#' @param account 
#' @param username 
#' @param password 
#' @param name 
#' @param email 
#' @param ... 
#' @examples createUser (account =  , username =  , password =  , name =  , email =  , ... =  )
#' @export 

createUser <-function (account, username, password, name, email, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/users/{{username}}", data = obj)
	res <- queryAPI(verb = POST, url = build_url(pathURL), source = "createUser", json = body, ...)
}


#' getUserConcurrency 
#' 
#' getUserConcurrency <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples getUserConcurrency (account =  , ... =  )
#' @export 

getUserConcurrency <-function (account, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1.1/users/{{username}}/concurrency", 
		data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getUserConcurrency", json = body, 
		...)
}


#' getListOfSubAccounts 
#' 
#' getListOfSubAccounts <- function(account, from, limit, ...){
#' @param account 
#' @param from 
#' @param limit 
#' @param ... 
#' @examples getListOfSubAccounts (account =  , from =  , limit =  , ... =  )
#' @export 

getListOfSubAccounts <-function (account, from, limit, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/users/{{username}}/list-subaccounts", 
		data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getListOfSubAccounts", json = body, 
		...)
}


#' getListOfSiblingAccounts 
#' 
#' getListOfSiblingAccounts <- function(account, page, per_page, ...){
#' @param account 
#' @param page 
#' @param per_page 
#' @param ... 
#' @examples getListOfSiblingAccounts (account =  , page =  , per_page =  , ... =  )
#' @export 

getListOfSiblingAccounts <-function (account, page, per_page, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1.1/users/{{username}}/siblings", data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getListOfSiblingAccounts", json = body, 
		...)
}


#' getSubAccountInformation 
#' 
#' getSubAccountInformation <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples getSubAccountInformation (account =  , ... =  )
#' @export 

getSubAccountInformation <-function (account, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/users/{{username}}/subaccounts ", 
		data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getSubAccountInformation", json = body, 
		...)
}


#' changeAccessKey 
#' 
#' changeAccessKey <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples changeAccessKey (account =  , ... =  )
#' @export 

changeAccessKey <-function (account, ...) {
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/users/{{username}}/accesskey/change", 
		data = obj)
	res <- queryAPI(verb = POST, url = build_url(pathURL), source = "changeAccessKey", json = body, ...)
}


