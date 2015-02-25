context("Checking dc_filled_pause")

library("qdap")

test_that("filled_pause returns a list of counts and filled_pause of the correct classes",{

    out <- with(pres_debates2012[1:200, ], dc_filled_pause(dialogue, person))

    cls <- structure(list(counts = "termco", filled_pause = c("qdap_context", 
        "data.frame")), .Names = c("counts", "filled_pause"))
    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "filled_pause"))
    
    expect_equal(sapply(out, class), cls)
})

