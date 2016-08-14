## jobMethods.R - compiled by RoxygenReady, a package by @vertesy


#' updateJob 
#' 
#' updateJob <- function(account, name, tags, public, passed, build, custom_data, ...){
#' @param account 
#' @param name 
#' @param tags 
#' @param public 
#' @param passed 
#' @param build 
#' @param custom_data 
#' @param ... 
#' @examples updateJob (account =  , name =  , tags =  , public =  , passed =  , build =  , custom_data =  , ... =  )
#' @export 

updateJob <-function (account, name, tags, public, passed, build, custom_data, ...) {
	pathTemplate <- whisker.render(":username/jobs/:job_id", data = obj)
	res <- queryAPI(verb = PUT, url = build_url(pathURL), source = "updateJob", json = body, ...)
}


#' deleteJob 
#' 
#' deleteJob <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples deleteJob (account =  , ... =  )
#' @export 

deleteJob <-function (account, ...) {
	pathTemplate <- whisker.render(":username/jobs/:job_id", data = obj)
	res <- queryAPI(verb = DELETE, url = build_url(pathURL), source = "deleteJob", json = body, ...)
}


#' stopJob 
#' 
#' stopJob <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples stopJob (account =  , ... =  )
#' @export 

stopJob <-function (account, ...) {
	pathTemplate <- whisker.render(":username/jobs/:job_id/stop", data = obj)
	res <- queryAPI(verb = PUT, url = build_url(pathURL), source = "stopJob", json = body, ...)
}


#' getJobAssetNames 
#' 
#' getJobAssetNames <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples getJobAssetNames (account =  , ... =  )
#' @export 

getJobAssetNames <-function (account, ...) {
	pathTemplate <- whisker.render(":username/jobs/:job_id/assets", data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getJobAssetNames", json = body, ...)
}


#' getJobAssetFiles 
#' 
#' getJobAssetFiles <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples getJobAssetFiles (account =  , ... =  )
#' @export 

getJobAssetFiles <-function (account, ...) {
	pathTemplate <- whisker.render(":username/jobs/:job_id/assets/:file_nameAccepted Values for :file_name selenium-server.logvideo.flvXXXXscreenshot.png (where XXXX is a number between 0000 and 9999)final_screenshot.png ", 
		data = obj)
	res <- queryAPI(verb = GET, url = build_url(pathURL), source = "getJobAssetFiles", json = body, ...)
}


#' deleteJobAssets 
#' 
#' deleteJobAssets <- function(account, ...){
#' @param account 
#' @param ... 
#' @examples deleteJobAssets (account =  , ... =  )
#' @export 

deleteJobAssets <-function (account, ...) {
	pathTemplate <- whisker.render(":username/jobs/:job_id/assets", data = obj)
	res <- queryAPI(verb = DELETE, url = build_url(pathURL), source = "deleteJobAssets", json = body, 
		...)
}


