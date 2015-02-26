context("Checking is.within_n_preceding_words")

library("qdap")

test_that("is.within_n_preceding_words returns logical as expected",{

    x <- c(
        "I like dogs and cats",
        "I do not like robots though",
        "Like I care.", NA
    )
    
    expect_equal(is.within_n_preceding_words(x, "I", 0)[-4], c(TRUE, TRUE, FALSE))
    expect_true(all(is.within_n_preceding_words(x, "I", 1)[-4]))
    expect_equal(is.within_n_preceding_words(x, "like", 4)[-4], c(TRUE, TRUE, FALSE))
    expect_true(all(is.within_n_preceding_words(x, "[Ll]ike", 4)[-4]))


})


