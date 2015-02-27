context("Checking discourse_connector_logical")

library("qdap")

test_that("discourse_connector_logical returns a list of counts, negatives and positives of the correct classes",{

    out <- with(pres_debates2012[1:200, ], discourse_connector_logical(dialogue, person, name = "typology"))

    cls <- structure(list(counts = "termco", positive = c("qdap_context", 
        "data.frame"), negative = c("qdap_context", "data.frame")), .Names = c("counts", 
        "positive", "negative"))
    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "positive", "negative"))
    
    expect_equal(sapply(out, class), cls)
})

test_that("discourse_connector_logical returns for multiple grouping variables",{

    out_tim_person <- with(pres_debates2012[1:200, ], 
        discourse_connector_logical(dialogue, list(time, person), name = "typology")
    )

    expect_equal(names(out_tim_person[["counts"]][[1]])[1], "time&person")
})

test_that("discourse_connector_logical returns a list of counts, single `qdap_context` of the correct classes when `name` not supplied",{

    out <- with(pres_debates2012[1:200, ], discourse_connector_logical(dialogue, person,
        names = c("I"),
        regex = "\\bI('[a-z]+)*\\b",
        terms = list(I = c(" I ", " I'")),
    ))

    cls <- structure(
        list(
            counts = "termco", 
            I = c("qdap_context", "data.frame")
        ), .Names = c("counts", "I")
    )

    
    expect_true(is.list(out))
    expect_equal(names(out), c("counts", "I"))
    
    expect_equal(sapply(out, class), cls)
})


test_that("discourse_connector_logical returns a list of counts, double `qdap_context` of the correct classes when `name` not supplied",{

    out2 <- with(pres_debates2012[1:200, ], discourse_connector_logical(dialogue, person,
        names = c("I", "you"),
        regex =  list(
            I = "\\bI('[a-z]+)*\\b",
            you = "\\b[Yy]ou('[a-z]+)*\\b"
        ),
        terms = list(
            I = c(" I ", " I'"),
            you = c(" you ", " you'")
        )
    ))



    cls2 <- structure(
        list(
            counts = "termco", 
            I = c("qdap_context", "data.frame"), 
            you = c("qdap_context", "data.frame")
        ), .Names = c("counts", "I", "you")
    )
   
    expect_true(is.list(out2))
    expect_equal(names(out2), c("counts", "I", "you"))
    
    expect_equal(sapply(out2, class), cls2)
})


test_that("discourse_connector_logical returns NULL if episode/text/connector not found",{

    out_null <- suppressMessages(with(pres_debates2012[1:20, ], discourse_connector_logical(dialogue, person,
        names = c("I"),
        regex = "\\bI('[a-z]+)*XXX\\b",
        terms = list(I = c(" IXXX ", " I'XXX"))
    )))

    expect_true(sum(out_null[[1]][[1]][, 3]) == 0)
    expect_true(is.null(out_null[[2]]))
    
})

test_that("discourse_connector_logical plots a lexical dispersion plot of class `ggplot`",{

    out <- with(pres_debates2012[1:200, ], discourse_connector_logical(dialogue, person,
        names = c("I"),
        regex = "\\bI('[a-z]+)*\\b",
        terms = list(I = c(" I ", " I'"))
    ))
    
    m <- plot(out, plot=FALSE)
    expect_true(is(m, "ggplot"))

    temp <-tempdir()
    pdf(file.path(temp, "temp.pdf"))
    m2 <- plot(out)
    dev.off()
    expect_true(is(m2, "ggplot"))    
    expect_true(file.exists(file.path(temp, "temp.pdf")))      
})


test_that("discourse_connector_logical plots a lexical dispersion when `grouping.var` is supplied",{

    keyWords <- with(pres_debates2012[c(1:100, 2500:2700), ], kwic(dialogue, list(time, person)))
    
    m <- with(pres_debates2012[c(1:100, 2500:2700), ], plot(keyWords, 
        grouping.var = person, rm.vars = time, total.color = NULL, 
        bg.color = "black", color = "yellow", horiz.color="grey20", plot=FALSE))
    
    expect_true(is(m, "ggplot"))
    
    m2 <- with(pres_debates2012[c(1:100, 2500:2700), ], plot(keyWords, 
        grouping.var = list(person, time), rm.vars = time, total.color = NULL, 
        bg.color = "black", color = "yellow", horiz.color="grey20", plot=FALSE))
    
    expect_true(is(m2, "ggplot"))    
   
})


test_that("discourse_connector_logical prints as expected",{

    out <- with(pres_debates2012[1:5, ], discourse_connector_logical(dialogue, person,
        names = c("I"),
        regex = "\\bI('[a-z]+)*\\b",
        terms = list(I = c(" I ", " I'"))
    ))
    
    expect_true(is.character(capture.output(out)))
})

test_that("discourse_connector_logical returns NULL if episode/text/connector not found",{

    out_null <- suppressMessages(with(pres_debates2012[1:20, ], discourse_connector_logical(dialogue, person,
        names = c("I"),
        regex = "\\bI('[a-z]+)*XXX\\b",
        terms = list(I = c(" IXXX ", " I'XXX"))
    )))

    expect_true(sum(out_null[[1]][[1]][, 3]) == 0)
    expect_true(is.null(out_null[[2]]))
    
})


test_that("discourse_connector_logical works when fun1 (logical text check) is passed",{

    out <- with(pres_debates2012[1:20, ], discourse_connector_logical(dialogue, person,
        names = c("I"),
        regex = "\\bI('[a-z]+)*\\b",
        terms = list(I = c(" I ", " I'")),
        fun1 = function(x) { nchar(x) < 83 }
    ))

    no_fun <- with(pres_debates2012[1:20, ], discourse_connector_logical(dialogue, person,
        names = c("I"),
        regex = "\\bI('[a-z]+)*\\b",
        terms = list(I = c(" I ", " I'"))
    ))
    
    is_less_than(nrow(out[[2]]), nrow(no_fun[[2]]))
    
})

test_that("discourse_connector_logical works when fun1 (logical group var. check) is passed",{

    out <- with(pres_debates2012[1:100, ], discourse_connector_logical(dialogue, person,
        names = c("I"),
        regex = "\\bI('[a-z]+)*\\b",
        terms = list(I = c(" I ", " I'")),
        fun2 = is.isolate
    ))

    no_fun <- with(pres_debates2012[1:100, ], discourse_connector_logical(dialogue, person,
        names = c("I"),
        regex = "\\bI('[a-z]+)*\\b",
        terms = list(I = c(" I ", " I'"))
    ))
    
    is_less_than(nrow(out[[2]]), nrow(no_fun[[2]]))
    
})
