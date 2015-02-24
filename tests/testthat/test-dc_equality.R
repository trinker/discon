context("Checking dc_equality")

library("qdap")

test_that("equality returns a list of counts and equality of the correct classes",{

    out <- with(pres_debates2012[1:200, ], dc_equality(dialogue, person))

    cls <- structure(list(counts = "termco", equality = c("qdap_context", 
        "data.frame")), .Names = c("counts", "equality"))

    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "equality"))
    
    expect_equal(sapply(out, class), cls)
})


test_that("equality_sub returns a list of counts and subs of the correct classes",{

    out2 <- with(pres_debates2012[1:200, ], dc_equality_sub(dialogue, person))

    cls2 <- structure(list(counts = "termco", none = c("qdap_context", "data.frame"
        ), continuation = c("qdap_context", "data.frame"), elaboration = c("qdap_context", 
       "data.frame")), .Names = c("counts", "none", "continuation", 
       "elaboration"))

    
    expect_true(is.list(out2))
    expect_equal(names(out2), c("counts", "none", "continuation", "elaboration"))
    
    expect_equal(sapply(out2, class), cls2)
})