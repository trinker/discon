## Hijack a function
## see: http://stackoverflow.com/a/25366322/1000343
hijack <- function(FUN, ...){

    .FUN <- FUN

    args <- list(...)
    invisible(lapply(seq_along(args), function(i) {
        formals(.FUN)[[names(args)[i]]] <<- args[[i]]
    }))

    .FUN
}

## Ellipsis recieving function changing
elli <- function(fun, myargs, ...){

    if (missing(myargs)) myargs <- list(...)

    formals_match <- names(myargs) %in% names(formals(fun))

    if (any(formals_match)){
        .FUN <- fun
        args <- myargs[formals_match] 
        invisible(lapply(seq_along(args), function(i) {
            formals(.FUN)[[names(args)[i]]] <<- args[[i]]
        }))
        fun <- .FUN
    } else {
        
        return(fun)
    }
    fun
}

binder <- function(x, ignore.case = FALSE, left = "\\b", right = left) {
    if (ignore.case){
        x <- ignore_case(x)
    }
    qdapRegex::pastex(qdapRegex::group(qdapRegex::bind(x, left = left, right = right)))
}
binder2 <- function(x, ignore.case = FALSE, left = "\\b", right = left) {
    paste0("(",binder(x, ignore.case = FALSE, left = left, right = right), ")")
}



## Ignore case in regex (i.e., convert `x` to [xX]`
ignore_case <- function(terms, left = "\\b", right = left){
    mapply(function(x, y) {
            gsub("(^[a-zA-Z])", paste0("[", tolower(y), toupper(y), "]"), x)
        }, terms, substring(terms, 1, 1), USE.NAMES = FALSE
    )
}

## Rename termco object's data frame's grouping variable
termco_group_name_replace <- function(x, nms){

    x[c("raw", "prop", "rnp")] <- lapply(x[c("raw", "prop", "rnp")], function(y, nm = nms){
        names(y)[1] <- nm
        y
    })
    x
}


## Capitalize Plot Titles
Caps <- function (x, all = FALSE) {
    if (all) {
        x <- strsplit(x, " ")[[1]]
    }
    paste(toupper(substring(x, 1, 1)), substring(x, 2), sep = "", 
        collapse = " ")
}

