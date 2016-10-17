context("info_methods_tests")
SLAccount <- account()

test_that("canGetSauceLabsStatus", {
  sauceStatus <- getSauceLabsStatus(SLAccount)
  expect_true(sauceStatus$service_operational)
})

test_that("canGetSupportedPlatforms", {
  supPlatforms <- getSupportedPlatforms(SLAccount)
  expect_gt(supPlatforms[, sum(os == "Linux")], 0L)
}
)

test_that("canGetAppiumEolDates", {
  eolDates <- getAppiumEolDates(SLAccount)
  chkEDates <-
    sum(vapply(eolDates,
               function(x){!(inherits(x, "POSIXct") || is.na(x))},
               logical(1)))
  expect_identical(chkEDates, 0L)
}
)
