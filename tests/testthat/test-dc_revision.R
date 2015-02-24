context("Checking dc_revision")

library("qdap")

test_that("revision returns a list of counts, negatives and positives of the correct classes",{

    out <- with(pres_debates2012[1:200, ], dc_revision(dialogue, person))

    cls <- structure(list(counts = "termco", revision = c("qdap_context", 
        "data.frame")), .Names = c("counts", "revision"))

    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "revision"))
    
    expect_equal(sapply(out, class), cls)
})
