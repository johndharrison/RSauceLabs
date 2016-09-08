context("js_unit_test_methods_tests")
SLAccount <- account()

test_that("canStartJsUnitTests", {
  platforms <- list(c("Windows 7", "firefox", "27"),
                    c("Linux", "googlechrome", "")
  )
  appUrl <- "https://saucelabs.com/test_helpers/front_tests/index.html"
  framework <- "jasmine"
  myTest <- startJsUnitTests(SLAccount, platforms = platforms
                             , url = appUrl, framework = framework)
  expect_identical(length(myTest$`js tests`), 2L)
}
)

test_that("canDeleteJobs", {
  # delete Job
  jobInfo <- getJobs(SLAccount, username = "seleniumPipes", limit = 2L, getFullJobs = TRUE)
  expect_true(!any(jobInfo$data[, !name == "jasmine tests"]))
  res <- lapply(jobInfo$data$id, function(x){
    deleteJob(SLAccount, username = "seleniumPipes", jobID = x)
  })
  expect_true(!any(sapply(res, "[[", "status") != "success"))
}
)


test_that("canGetJsUnitTestStauts", {
  platforms <- list(c("Windows 7", "firefox", "27"),
                    c("Linux", "googlechrome", "")
  )
  appUrl <- "https://saucelabs.com/test_helpers/front_tests/index.html"
  framework <- "jasmine"
  myTest <- startJsUnitTests(SLAccount, platforms = platforms
                             , url = appUrl, framework = framework)
  expect_identical(length(myTest$`js tests`), 2L)

  chk <- FALSE
  jsStatus <- getJsUnitTestStatus(SLAccount, username = "seleniumPipes"
                             , js_tests = unlist(myTest, use.names = FALSE))
  expect_true(is.logical(jsStatus$completed))

  # delete jobs
  while(!chk){
    Sys.sleep(20)
    jsStatus <- getJsUnitTestStatus(SLAccount, username = "seleniumPipes"
                                    , js_tests = unlist(myTest, use.names = FALSE))
    chk <- jsStatus$completed
  }
  res <- lapply(sapply(jsStatus$`js tests`, "[[", "job_id"), function(x){
    deleteJob(SLAccount, username = "seleniumPipes", jobID = x)
  })
  expect_true(!any(sapply(res, "[[", "status") != "success"))

}
)

