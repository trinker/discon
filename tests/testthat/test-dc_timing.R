context("Checking dc_timing")

library("qdap")

test_that("timing returns a list of counts and timing of the correct classes",{

    out <- with(pres_debates2012[1:200, ], dc_timing(dialogue, person))

    cls <- structure(list(counts = "termco", timing = c("qdap_context", 
        "data.frame")), .Names = c("counts", "timing"))

    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "timing"))
    
    expect_equal(sapply(out, class), cls)
})

