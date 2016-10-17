context("temp_storage_methods_tests")
SLAccount <- account()

test_that("canUpLoadFile", {
  myTempFile <- tempfile(fileext = ".html")
  write("SUPER SECRET STUFF", myTempFile)
  myStoredFiles <- getStoredFiles(SLAccount, username = "seleniumPipes")
  expect_false(basename(myTempFile) %in%
                 vapply(myStoredFiles$files, "[[", character(1), "name"))

  res <- uploadFile(SLAccount, file = myTempFile)
  myStoredFiles <- getStoredFiles(SLAccount, username = "seleniumPipes")
  expect_true(basename(myTempFile) %in%
                vapply(myStoredFiles$files, "[[", character(1), "name"))

})

test_that("canGetStoredFiles", {
  myStoredFiles <- getStoredFiles(SLAccount, username = "seleniumPipes")
  expect_true(!is.null(myStoredFiles$files))
}
)
