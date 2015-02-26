context("Checking dc_well")

library("qdap")

test_that("dc_well returns a list of counts and well of the correct classes",{

    out <- with(pres_debates2012[1:500, ], dc_well(dialogue, person))

    cls <- structure(list(counts = "termco", well = c("qdap_context", 
        "data.frame")), .Names = c("counts", "well"))
    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "well"))
    
    expect_equal(sapply(out, class), cls)
})


test_that("dc_well_begin returns a list of counts and well of the correct classes",{

    out <- with(pres_debates2012, dc_well_begin(dialogue, person))

    cls <- structure(list(counts = "termco", well = c("qdap_context", 
        "data.frame")), .Names = c("counts", "well"))
    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "well"))
    
    expect_equal(sapply(out, class), cls)
})
