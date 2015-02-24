context("Checking dc_causality")

library("qdap")

test_that("causality returns a list of counts and causality of the correct classes",{

    out <- with(pres_debates2012[1:200, ], dc_causality(dialogue, person))

    cls <- structure(list(counts = "termco", causality = c("qdap_context", 
        "data.frame")), .Names = c("counts", "causality"))

    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "causality"))
    
    expect_equal(sapply(out, class), cls)
})

test_that("causality_sub returns a list of counts and subs of the correct classes",{

    out2 <- with(pres_debates2012[1:200, ], dc_causality_sub(dialogue, person))

    cls2 <- structure(list(counts = "termco", continuation = c("qdap_context", 
        "data.frame"), elaboration = c("qdap_context", "data.frame")), .Names = c("counts", 
        "continuation", "elaboration"))

    
    expect_true(is.list(out2))
    expect_equal(names(out2), c("counts", "continuation", "elaboration"))
    
    expect_equal(sapply(out2, class), cls2)
})