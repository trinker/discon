context("Checking dc_backchannel")

library("qdap")

test_that("backchannel returns a list of counts and backchannel of the correct classes",{

    out <- with(pres_debates2012[1:200, ], dc_backchannel(dialogue, person))

    cls <- structure(list(counts = "termco", backchannel = c("qdap_context", 
        "data.frame")), .Names = c("counts", "backchannel"))
    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "backchannel"))
    
    expect_equal(sapply(out, class), cls)
})

