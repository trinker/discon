context("Checking dc_negator")

library("qdap")

test_that("negator returns a list of counts and negator of the correct classes",{

    out <- with(pres_debates2012[1:200, ], dc_negator(dialogue, person))

    cls <- structure(list(counts = "termco", negator = c("qdap_context", 
        "data.frame")), .Names = c("counts", "negator"))

    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "negator"))
    
    expect_equal(sapply(out, class), cls)
})


test_that("negator_sub returns a list of counts and subs of the correct classes",{

    out2 <- with(pres_debates2012[1:200, ], dc_negator_sub(dialogue, person))

    cls2 <- structure(list(counts = "termco", negative_words = c("qdap_context", 
        "data.frame"), negative_prefix = c("qdap_context", "data.frame"
        ), negative_contractions = c("qdap_context", "data.frame")), .Names = c("counts", 
        "negative_words", "negative_prefix", "negative_contractions"))
    
    expect_true(is.list(out2))
    expect_equal(names(out2), c("counts", "negative_words", "negative_prefix", 
        "negative_contractions"))
    
    expect_equal(sapply(out2, class), cls2)
})