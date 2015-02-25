context("Checking dc_comparison")

library("qdap")

test_that("dc_comparison returns a list of counts and comparison of the correct classes",{

    out <- with(pres_debates2012[1:200, ], dc_comparison(dialogue, person))

    cls <- structure(list(counts = "termco", comparison = c("qdap_context", 
        "data.frame")), .Names = c("counts", "comparison"))
    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "comparison"))
    
    expect_equal(sapply(out, class), cls)
})


test_that("dc_comparison works with grouping variable(s)",{

    out <- with(pres_debates2012[1:200, ], dc_comparison(dialogue, list(time, person)))

    cls <- structure(list(counts = "termco", comparison = c("qdap_context", 
        "data.frame")), .Names = c("counts", "comparison"))
    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "comparison"))
    
    expect_equal(sapply(out, class), cls)
})


test_that("dc_comparison throws warning when user supplies terms",{

    expect_warning(with(pres_debates2012[1:200, ], dc_comparison(dialogue, person,
        names = c("I"),
        regex = "\\bI('[a-z]+)*\\b",
        terms = list(I = c(" I ", " I'")),
        markup.regex = "\\b(I('[a-z]+)*)\\b",
        name = NULL)))

})

test_that("dc_comparison throws warning when user supplies terms and multiple regexes",{

    expect_warning(with(pres_debates2012[1:200, ], dc_comparison(dialogue, person,
        names = c("I", "you"),
        regex =  list(
            I = "I('[a-z]+)*\\b",
            you = "(\\b[Yy]ou('[a-z]+)*\\b)"
        ),
        terms = list(
            I = c(" I ", " I'"),
            you = c(" you ", " you'")
        ),
        name = NULL)))        
})

