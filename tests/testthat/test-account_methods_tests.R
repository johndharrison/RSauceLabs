context("account_methods_tests")

test_that("canCreateAccountObject", {
  SLAccount <- account()
  expect_true(inherits(SLAccount, "account"))
})

test_that("canGetUser", {
 userInfo <- getUser(SLAccount)
 expect_identical(userInfo$username, "seleniumPipes")
}
)

test_that("canGetSubUser", {
  userInfo <- getUser(SLAccount, username = "rsaucelabs")
  expect_identical(userInfo$username, "rsaucelabs")
}
)


test_that("checkCanCreateSubAccount", {
  expect_warning(
    newUser <- createUser(SLAccount, username = "seleniumPipes",
                        newUsername = "testUser12367", password = "testPass",
                        name = "aUser", email = "testUser@example.com")
  )
  expect_identical(newUser$error, "Sorry, the email you've provided is already associated with another account. Please use another email address.")
}

)

test_that("canGetUserConcurrency", {
  userConcur <- getUserConcurrency(SLAccount, username = "seleniumPipes")
  expect_identical(userConcur$concurrency$self$username, "seleniumPipes")
}
)

test_that("canGetSubUserConcurrency", {
  userConcur <- getUserConcurrency(SLAccount, username = "rsaucelabs")
  expect_identical(userConcur$concurrency$self$username, "rsaucelabs")
  expect_identical(userConcur$concurrency$ancestor$username, "seleniumPipes")
}
)

test_that("canGetListOfSubAccounts", {
  userAccs <- getListOfSubAccounts(SLAccount, username = "seleniumPipes")
  expect_equal(userAccs$users_total, 2L)
  expect_identical(sapply(userAccs$users, "[[", "username"), c("rsaucelabs", "testUser12367"))
}
)

test_that("canGetListOfSiblingAccounts", {
  sibAccs <- getListOfSiblingAccounts(SLAccount, username = "rsaucelabs")
  expect_identical(sapply(sibAccs, "[[", "username"), "testUser12367")
}
)
