context("Checking dc_oh")

library("qdap")

test_that("oh returns a list of counts and oh of the correct classes",{

    out <- with(pres_debates2012[1:1000, ], dc_oh(dialogue, person))

    cls <- structure(list(counts = "termco", oh = c("qdap_context", 
        "data.frame")), .Names = c("counts", "oh"))
    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "oh"))
    
    expect_equal(sapply(out, class), cls)
})

