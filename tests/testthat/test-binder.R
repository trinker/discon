context("Checking binder")

test_that("binder is collapsing into OR separated grouped boundaries",{

    expect_equal(binder(LETTERS[1:5]),
        "(\\bA\\b)|(\\bB\\b)|(\\bC\\b)|(\\bD\\b)|(\\bE\\b)"
    )

    expect_equal(binder(LETTERS[1:5], ignore.case = TRUE), 
        "(\\b[aA]\\b)|(\\b[bB]\\b)|(\\b[cC]\\b)|(\\b[dD]\\b)|(\\b[eE]\\b)"
    )
})

test_that("binder2 is collapsing into OR separated grouped boundaries",{
    
    expect_equal(binder2(LETTERS[1:5], ignore.case = TRUE), 
        "((\\bA\\b)|(\\bB\\b)|(\\bC\\b)|(\\bD\\b)|(\\bE\\b))"
    )
    
})

test_that("binder3 is collapsing into OR separated grouped boundaries",{
    
    expect_equal(binder3(LETTERS[1:5], ignore.case = TRUE), 
        "([aA]|[bB]|[cC]|[dD]|[eE])"
    )
    
})
