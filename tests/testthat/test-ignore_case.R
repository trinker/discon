context("Checking ignore_case")

test_that("ignore_case subs out with a regex upper/lower character cass",{

    expect_equal(ignore_case(LETTERS[1:5]), ignore_case(letters[1:5]))
    expect_equal(paste(ignore_case(LETTERS[1:5]), collapse=""),
        "[aA][bB][cC][dD][eE]"
    )


})



