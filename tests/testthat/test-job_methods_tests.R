context("job_methods_tests")
SLAccount <- account()

test_that("canGetJobsBasic", {
  jobs <- getJobs(SLAccount, "seleniumPipes", limit = 10L)
  expect_equal(length(jobs$data$id), 10L)
})

test_that("canGetJobsFull", {
  jobs <- getJobs(SLAccount, "seleniumPipes", limit = 10L, getFullJobs = TRUE)
  expect_equal(sum(c("browser", "passed") %in% names(jobs$data)), 2L)
})

test_that("canUpdateJob", {
  jobs <- getJobs(SLAccount, "seleniumPipes", limit = 10L, getFullJobs = TRUE)
  # use first job
  appJob <- jobs$data[1,]
  newData <- updateJob(SLAccount, username = "seleniumPipes", jobID = appJob$id,
                       name = "newName", passed = !appJob$passed, build = "someBuild")
  expect_identical(appJob$passed, !newData$passed)
  expect_false(appJob$name == newData$name)
  expect_identical(newData$name, "newName")
  expect_false(appJob$build == newData$build)
  expect_identical(newData$build, "someBuild")
  oldData <- updateJob(SLAccount, username = "seleniumPipes", jobID = appJob$id,
                       name = appJob$name, passed = appJob$passed, build = appJob$build)
}
)

test_that("canStopJob", {
  jobs <- getJobs(SLAccount, "seleniumPipes", limit = 10L)
  # use first job
  appJob <- jobs$data[1,]
  sJob <- stopJob(SLAccount, "seleniumPipes", appJob$id)
  expect_identical(appJob$id, sJob$id)
}
)

test_that("canGetJobAssets", {
  jobs <- getJobs(SLAccount, "seleniumPipes", limit = 10L)
  # use first job
  appJob <- jobs$data[1,]
  jobAssets <- getJobAssetNames(SLAccount, "seleniumPipes", appJob$id)
  expect_identical(jobAssets$`selenium-log`, "selenium-server.log")
}
)

test_that("canGetJobAssetFiles", {
  jobs <- getJobs(SLAccount, "seleniumPipes", limit = 10L)
  # use first job
  appJob <- jobs$data[1,]
  selLog <- getJobAssetFiles(SLAccount, username = "seleniumPipes", jobID = appJob$id)
  expect_true(grepl("COMMAND InitSession", selLog))
}
)
