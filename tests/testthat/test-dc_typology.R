context("Checking dc_typology")

library("qdap")

test_that("typology returns a list of counts, negatives and positives of the correct classes",{

    out <- with(pres_debates2012[1:200, ], dc_typology(dialogue, person))


    cls <- structure(list(counts = "termco", positive = c("qdap_context", 
        "data.frame"), negative = c("qdap_context", "data.frame")), .Names = c("counts", 
        "positive", "negative"))
    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "positive", "negative"))
    
    expect_equal(sapply(out, class), cls)
})
