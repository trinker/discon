context("Checking dc_oh")

library("qdap")

test_that("dc_oh returns a list of counts and oh of the correct classes",{

    out <- with(pres_debates2012[1:500, ], dc_oh(dialogue, person))

    cls <- structure(list(counts = "termco", oh = c("qdap_context", 
        "data.frame")), .Names = c("counts", "oh"))
    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "oh"))
    
    expect_equal(sapply(out, class), cls)
})


test_that("dc_oh_begin returns a list of counts and oh of the correct classes",{

    out <- with(pres_debates2012[1:500, ], dc_oh_begin(dialogue, person))

    cls <- structure(list(counts = "termco", oh = c("qdap_context", 
        "data.frame")), .Names = c("counts", "oh"))
    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "oh"))
    
    expect_equal(sapply(out, class), cls)
})
