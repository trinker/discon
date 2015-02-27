context("Checking elli")

test_that("elli is overtakes formals",{

    unlist2 <- elli(unlist, list(use.names = FALSE))
    expect_equal(unlist2(list(a=1, b=2)),  1:2)
    
    fun <- function(x, ...){
        elli(unlist, ...)(x)
    }
    
    expect_equal(fun(list(a=1, b=2), use.names= FALSE), 1:2)
    
    expect_equal(fun(list(a=1, b=2), boo= FALSE), unlist2(list(a=1, b=2), use.names= TRUE))

})


