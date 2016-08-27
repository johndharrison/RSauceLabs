## jobMethods.R - compiled by RoxygenReady, a package by @vertesy


#' Update Job
#'
#' Edit an existing job
#' @template account
#' @param username SauceLabs username
#' @param jobID Id of the job to edit
#' @param name Change the job name
#' @param tags Change the job tags
#' @param public Set job visibility to "public", "public restricted", "share" (true), "team" (false) or "private"
#' @param passed Set whether the job passed or not on the user end
#' @param build The build number tested by this test
#' @param custom_data A  set of key-value pairs with any extra info that a user would like to add to the job. Note that the max data allowed is 64KB
#' @template ellipsis
#' @examples updateJob (account =  , name =  , tags =  , public =  , passed =  , build =  , custom_data =  , ... =  )
#' @export

updateJob <-function (account, username = Sys.getenv("SLUSER"), jobID, name = NULL, tags = NULL, public = NULL, passed = NULL
                      , build = NULL, custom_data, ...) {
  obj <- list()
  obj$job_id <- jobID
  obj$username <- username
  body <- toJSON(
    list(
      name = unbox(name),
      tags = tags,
      public = unbox(public),
      passed = unbox(passed),
      build = unbox(build),
      custom_data = custom_data
    )
  )
  pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/{{username}}/jobs/{{job_id}}", data = obj)
	pathURL <- parse_url(pathTemplate)
	res <- queryAPI(verb = PUT, account = account, url = build_url(pathURL), source = "updateJob"
	                , body = body, ...)
	res
}


#' Delete Job
#'
#' Removes the job from the system with all the linked assets
#' @template account
#' @param username SauceLabs username
#' @param jobID Id of the job to delete
#' @template ellipsis
#' @examples deleteJob (account =  , ... =  )
#' @export

deleteJob <-function (account, username = Sys.getenv("SLUSER"), jobID, ...) {
	obj <- list()
	obj$job_id <- jobID
	obj$username <- username
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/{{username}}/jobs/{{job_id}}", data = obj)
	pathURL <- parse_url(pathTemplate)
	res <- queryAPI(verb = DELETE, account = account, url = build_url(pathURL), source = "deleteJob",
		json = body, ...)
	res
}


#' Stop Job
#'
#' Terminates a running job
#' @template account
#' @param username SauceLabs username
#' @param jobID Id of the job to stop
#' @template ellipsis
#' @examples stopJob (account =  , ... =  )
#' @export

stopJob <-function (account, username = Sys.getenv("SLUSER"), jobID, ...) {
	obj <- list()
	obj$username <- username
	obj$job_id <- jobID
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/{{username}}/jobs/{{job_id}}/stop",
		data = obj)
	pathURL <- parse_url(pathTemplate)
	res <- queryAPI(verb = PUT, account = account, url = build_url(pathURL), source = "stopJob", json = body,
		...)
	res
}


#' Get Job Asset Names
#'
#' Get details about the static assets collected for a specific job
#' @template account
#' @param username SauceLabs username
#' @param jobID Id of the job to stop
#' @template ellipsis
#' @examples getJobAssetNames (account =  , ... =  )
#' @export

getJobAssetNames <-function (account, username = Sys.getenv("SLUSER"), jobID, ...) {
	obj <- list()
	obj$username <- username
	obj$job_id <- jobID
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/{{username}}/jobs/{{job_id}}/assets",
		data = obj)
	pathURL <- parse_url(pathTemplate)
	res <- queryAPI(verb = GET, account = account, url = build_url(pathURL), source = "getJobAssetNames",
		json = body, ...)
	res
}


#' Get Job Asset Files
#'
#' Download job assets. After a job completes, all assets created during the job are available via this API. These include the screencast recording, logs, and screenshots taken on crucial steps.
#' The job assests will be deleted from the test page after 30 days. Thus, after 30 days all your test commands, logs, screenshots and the screencast recording will be gone. This is the reason why we strongly recommend to download your job assets if this is an information that you must keep in your records.
#' @template account
#' @param username SauceLabs username
#' @param jobID Id of the job to get assets from
#' @param fileName Accepted Values for fileName "selenium-server.log" "video.flv" "XXXXscreenshot.png" (where XXXX is a number between 0000 and 9999) "final_screenshot.png"
#' @template ellipsis
#' @examples getJobAssetFiles (account =  , ... =  )
#' @export

getJobAssetFiles <-function (account, username = Sys.getenv("SLUSER"), jobID, fileName = "selenium-server.log", ...) {
	obj <- list()
	obj$username <- username
	obj$job_id <- jobID
	obj$file_name <- fileName
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/{{username}}/jobs/{{job_id}}/assets/{{file_name}}",
		data = obj)
	pathURL <- parse_url(pathTemplate)
	res <- queryAPI(verb = GET, account = account, url = build_url(pathURL), source = "getJobAssetFiles",
		json = body, ...)
	res
}


#' Delete Job Assets
#'
#' Delete all the assets captured during a test run. This includes the screencast recording, logs, and all screenshots.
#' @template account
#' @param username SauceLabs username
#' @param jobID Id of the job to delete assests from
#' @template ellipsis
#' @examples deleteJobAssets (account =  , ... =  )
#' @export

deleteJobAssets <-function (account, username = Sys.getenv("SLUSER"), jobID, ...) {
	obj <- list()
	obj$username <- username
	obj$job_id <- jobID
	pathTemplate <- whisker.render("https://saucelabs.com/rest/v1/{{username}}/jobs/{{job_id}}/assets",
		data = obj)
	pathURL <- parse_url(pathTemplate)
	res <- queryAPI(verb = DELETE, account = account, url = build_url(pathURL), source = "deleteJobAssets",
		json = body, ...)
	res
}


