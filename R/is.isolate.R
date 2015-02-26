#' Check if Element Is Isolated
#' 
#' \code{is.isolate} - Logical check of each element in a vector to determine if 
#' an element is isolated, that is not repeated.
#' 
#' @param x  A vector of elements.
#' @return Returns a logical vector equal in length to x.
#' @export
#' @rdname is.isolate
#' @examples
#' set.seed(3)
#' (x <- sample(1:3, 9, TRUE))
#' is.isolate(x)
#' is.repeat(x)
is.isolate <- function(x) {
    y <- rle(as.character(x))
    out <- rep(FALSE, length(y[[1]]))
    out[y[[1]] == 1] <- TRUE
    rep(out,  y[[1]])  
}

#' Check if Element is Isolated
#' 
#' \code{is.repeat} - The (semantical) "inverse" to \code{is.isolate}.
#' 
#' @export
#' @rdname is.isolate
is.repeat <- function(x) {
    !is.isolate(x)  
}