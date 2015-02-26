context("Checking is.first_in_set")

library("qdap")

test_that("is.first_in_set returns logical as expected",{

    expect <- c(TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE)
    x <- c(1L, 3L, 2L, 1L, 2L, 2L, 1L, 1L, 2L, NA)
    y <- LETTERS[x]
    z <- as.factor(y)
    expect_equal(is.first_in_set(x), expect)
    expect_equal(is.first_in_set(y), expect)
    expect_equal(is.first_in_set(z), expect)     

})


test_that("is.last_in_set returns logical as expected",{

    expect2 <- c(TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE)
    x <- c(1L, 3L, 2L, 1L, 2L, 2L, 1L, 1L, 2L, NA)
    y <- LETTERS[x]
    z <- as.factor(y)
    expect_equal(is.last_in_set(x), expect2)
    expect_equal(is.last_in_set(y), expect2)
    expect_equal(is.last_in_set(z), expect2)     

})
