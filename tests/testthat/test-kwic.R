context("Checking kwic")

library("qdap")

test_that("kwic returns a list of counts, and terms of the correct classes",{

    out <- with(pres_debates2012[1:200, ], kwic(dialogue, person))

    cls <- structure(list(counts = "termco", KeyWords = c("qdap_context", 
        "data.frame")), .Names = c("counts", "KeyWords"))
    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "KeyWords"))
    
    expect_equal(sapply(out, class), cls)
})

test_that("kwic returns for multiple grouping variables",{

    out_time_person <- with(pres_debates2012[1:200, ], 
        kwic(dialogue, list(time, person))
    )

    expect_equal(names(out_time_person[["counts"]][[1]])[1], "time&person")
})
