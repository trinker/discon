context("Checking is.isolate")

library("qdap")

test_that("is.isolate returns logical as expected",{

    expect <- c(TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE)
    x <- c(1L, 3L, 2L, 1L, 2L, 2L, 1L, 1L, 2L, NA)
    y <- LETTERS[x]
    z <- as.factor(y)
    expect_equal(is.isolate(x), expect)
    expect_equal(is.isolate(y), expect)
    expect_equal(is.isolate(z), expect)    

})


test_that("is.repeat returns logical as expected",{

    expect <- c(TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE)
    x <- c(1L, 3L, 2L, 1L, 2L, 2L, 1L, 1L, 2L, NA)
    y <- LETTERS[x]
    z <- as.factor(y)
    expect_equal(is.repeat(x), !expect)
    expect_equal(is.repeat(y), !expect)
    expect_equal(is.repeat(z), !expect)  
    
})