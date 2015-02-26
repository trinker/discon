context("Checking dc_connective")

library("qdap")

test_that("dc_connective returns a list of counts and connective of the correct classes",{

    out <- with(pres_debates2012[1:200, ], dc_connective(dialogue, person))

    cls <- structure(list(counts = "termco", connect = c("qdap_context", 
        "data.frame")), .Names = c("counts", "connective"))

    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "connective"))
    
    expect_equal(sapply(out, class), cls)
})

test_that("dc_connective_sub returns a list of counts and subs of the correct classes",{

    out2 <- with(pres_debates2012[1:200, ], dc_connective_sub(dialogue, person))

    cls2 <- structure(list(counts = "termco", and = c("qdap_context", "data.frame"
        ), but = c("qdap_context", "data.frame"), or = c("qdap_context", 
        "data.frame")), .Names = c("counts", "and", "but", "or"))

    
    expect_true(is.list(out2))
    expect_equal(names(out2), c("counts", "and", "but", "or"))
    
    expect_equal(sapply(out2, class), cls2)
})