context("Checking termco_group_name_replace")

test_that("termco_group_name_replace is replacing termco_group_name_replaces",{

    termco_object <- structure(list(raw = structure(list(person = structure(1:2, .Label = c("A", 
        "B"), class = "factor"), word.count = c(6, 1), wrds = c(2, 1), 
            `@` = c(3, 0), bryan = c(5, 0)), .Names = c("person", "word.count", 
        "wrds", "@", "bryan"), row.names = 1:2, class = "data.frame", by.row = structure(list(
            person = structure(c(1L, 2L, 1L), .Label = c("A", "B"), class = "factor"), 
            word.count = c(5, 1, 1), `term(bryan)` = c(2, 0, 0), `term(indeed)` = c(0, 
            1, 0), `term(@)` = c(2, 0, 1), `term(bryan)` = c(2, 0, 0), 
            `term(@ br)` = c(0, 0, 1), `term(@br)` = c(2, 0, 0)), .Names = c("person", 
        "word.count", "term(bryan)", "term(indeed)", "term(@)", "term(bryan)", 
        "term(@ br)", "term(@br)"), row.names = c(NA, -3L), class = "data.frame")), 
            prop = structure(list(person = structure(1:2, .Label = c("A", 
            "B"), class = "factor"), word.count = c(6, 1), wrds = c(33.3333333333333, 
            100), `@` = c(50, 0), bryan = c(83.3333333333333, 0)), .Names = c("person", 
            "word.count", "wrds", "@", "bryan"), row.names = c(NA, -2L
            ), class = "data.frame"), rnp = structure(list(person = structure(1:2, .Label = c("A", 
            "B"), class = "factor"), word.count = c(6, 1), wrds = c("2(33.33%)", 
            "1(100.00%)"), `@` = c("3(50.00%)", "0"), bryan = c("5(83.33%)", 
            "0")), .Names = c("person", "word.count", "wrds", "@", "bryan"
            ), row.names = c(NA, -2L), class = "data.frame"), zero.replace = 0, 
            percent = TRUE, digits = 2), .Names = c("raw", "prop", "rnp", 
        "zero.replace", "percent", "digits"), class = "termco")
    
    
    output <- termco_group_name_replace(termco_object, "foo")
     
    expect_true(all(sapply(output[1:3], function(x) names(x)[1]) %in% "foo"))

})


