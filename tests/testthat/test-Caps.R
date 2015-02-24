context("Checking Caps")

test_that("Caps is replacing Correctly",{

    x <- "dogs cats"

    expect_equal(Caps(x), "Dogs cats")
    expect_equal(Caps(x, TRUE), "Dogs Cats")

})


