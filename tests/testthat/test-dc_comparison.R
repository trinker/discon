context("Checking dc_comparison")

library("qdap")

test_that("comparison returns a list of counts and comparison of the correct classes",{

    out <- with(pres_debates2012[1:200, ], dc_comparison(dialogue, person))

    cls <- structure(list(counts = "termco", comparison = c("qdap_context", 
        "data.frame")), .Names = c("counts", "comparison"))
    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "comparison"))
    
    expect_equal(sapply(out, class), cls)
})

