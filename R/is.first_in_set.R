#' Check if Element Is First in a Set
#' 
#' \code{is.first_in_set} - Logical check of each element in a vector to 
#' determine if an element is first in set.
#' 
#' @param x  A vector of elements.
#' @return Returns a logical vector equal in length to x.
#' @export
#' @rdname is.first_in_set
#' @examples
#' set.seed(3)
#' (x <- sample(1:3, 9, TRUE))
#' is.first_in_set(x)
#' is.last_in_set(x)
is.first_in_set <- function (x) {
    y <- rle(as.character(x))
    out <- rep(FALSE, length(x))
    out[length(x)+1-cumsum(rev(y$lengths))] <- TRUE
    out
}

#' Check if Element is first_in_set
#' 
#' \code{is.last_in_set} - The (semantical) "inverse" to \code{is.first_in_set}.
#' 
#' @export
#' @rdname is.first_in_set
is.last_in_set <- function(x) {

    y <- rle(as.character(x))
    out <- rep(FALSE, length(x))
    out[cumsum(y[[1]])] <- TRUE
    out

}

