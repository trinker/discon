#' Check if Element Is Within N Preceding Words
#' 
#' Logical check of each element in a vector to determine if 
#' an element occurs within n preceding words.
#' 
#' @param x  A vector of elements.
#' @param regex.term A regular expression that represents a word or term.
#' @param n A max number of words (defined as \code{([a-zA-Z-]+,*\\s+)}) that 
#' \code{regex.term} must occur before.
#' @return Returns a logical vector equal in length to x.
#' @export
#' @rdname is.within_n_preceding_words
#' @examples
#' x <- c(
#'     "I like dogs and cats", 
#'     "I do not like robots though", 
#'     "Like I care."
#' )
#' 
#' is.within_n_preceding_words(x, "I", 0)
#' is.within_n_preceding_words(x, "I", 1)
#' is.within_n_preceding_words(x, "like", 4)
#' is.within_n_preceding_words(x, "[Ll]ike", 4)
is.within_n_preceding_words <- function(x, regex.term, n = 0){
    grepl(sprintf("^([a-zA-Z-]+,*\\s+){0,%s}%s\\b", n, regex.term), x)
}

