#' Extract Key Words in Context
#'
#' Extract key words in context (kwic) utilizing \code{\link[qdap]{freq_terms}}.
#' 
#' @param text.var The text variable. 
#' @param grouping.var The grouping variables.  Also takes a single 
#' grouping variable or a list of 1 or more grouping variables.
#' @param n.before The number of rows before the indexed occurrence.
#' @param tot logical.  If \code{TRUE} condenses sub-units (e.g., sentences) 
#' into turns of talk for that \code{grouping.var}.
#' @param n.after The number of rows after the indexed occurrence.
#' @param ord.inds logical.  If \code{TRUE} inds is ordered least to greatest.
#' @param markup A character vector of length two indicating the left (element 
#' 1) and right (element 2) boundary markers to use to highlight the 
#' key words.  Use \code{c("", "")} to not mark the discourse 
#' connectors.
#' @param top Top number of terms to show.
#' @param at.least An integer indicating at least how many letters a word 
#' must be to be included in the output.
#' @param extend logical.  If \code{TRUE} the \code{top} argument is extended to 
#' any word that has the same frequency as the \code{top} word.
#' @param ignore.case logical.  If \code{TRUE} leading character's case is 
#' ignored. 
#' @param left The left boundary (regular expression) to put on the left side of 
#' words.  Default is 
#' \href{http://www.regular-expressions.info/wordboundaries.html}{word boundary} 
#' (i.e., \code{\\\\b}) that cuts off at non-word characters.  
#' @param right The right boundary (regular expression) to put on the right side 
#' of words.  Default is no boundary and will locate words within words.  For 
#' example the expression \code{"\\\\blast"} will find "last" and "lastly" but not 
#' "blast".  To capture precisely key words use \code{right = "\\\\b"} or 
#' \code{right = left}.
#' @param names A string indicating the name of the key words in the collective
#' group name for the key words for use in the \code{\link[qdap]{termco}} and 
#' generic \code{plot} (\code{\link[qdap]{dispersion_plot}}) functions.
#' @param elim.old logical.  If \code{TRUE} eliminates the columns that are 
#' combined together by the named match.list.
#' @param stopwords A character vector of words to remove from the text.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @details While \code{kwic} does not analyze discourse connectors, it is useful
#' in identifying themes (and distribution across time) and builds upon the 
#' modular use of functions in the pkg{discon} package.
#' @return Returns returns a list of 2-3: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of discourse connector counts.} 
#' \item{Context 1}{A \code{\link[qdap]{trans_context}} object of the key words in context.  Note the name of this object is supplied by \code{names} element one.} 
#' \item{Context 2...n}{An optional (not returned if \code{regex} is of length one) \code{\link[qdap]{trans_context}} object of the key words in context.  Note the name of this (these) object(s) is supplied by \code{names} element 2...n.} 
#' @references Ryan, G. W. & Bernard, H. R. (2003). \href{http://goo.gl/KdYxB8}{Techniques to identify themes}. \emph{Field Methods. 15}(1), 85-109. doi: \href{http://fmx.sagepub.com/content/15/1/85}{10.1177/1525822X02239569}
#'
#' @keywords key words frequent kwic
#' @export
#' @importFrom qdap trans_context termco
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}},
#' \code{\link[qdap]{freq_terms}}
#' @rdname kwic
#' @include utils.R internal_data_bases_list.R internal_data_regex_list.R internal_data_term_list.R
#' @examples
#' out <- with(pres_debates2012, kwic(dialogue, list(time, person)))
#' plot(out[[1]])
#' head(out[[2]])
#' with(pres_debates2012, plot(out, grouping.var = person, rm.vars = time, 
#'     total.color = NULL))
#' 
#' ## Save externally use .doc or .txt
#' ## print(out[[2]], file="kwic.doc")
kwic <- function(text.var, grouping.var, n.before = 1, tot = FALSE, 
    n.after = n.before, ord.inds = TRUE, markup = c("<<", ">>"), top = 15,
    at.least = 5, extend = TRUE, ignore.case = FALSE, left = "\\b", right = "",
    names = c("KeyWords"), elim.old = FALSE, 
    stopwords = c("going", qdapDictionaries::contractions[[1]], 
        qdapDictionaries::Top200Words), ...){

    ## Grab the grouping variable name
    if (is.list(grouping.var)) {
        m <- unlist(as.character(substitute(grouping.var))[-1])
        m <- sapply(strsplit(m, "$", fixed=TRUE), function(x) {
                x[length(x)]
            }
        )
        group.nms <- paste(m, collapse="&")
    } else {
        G <- as.character(substitute(grouping.var))
        group.nms <- G[length(G)]
    }

    ## Determine top n words
    topterms <- qdap::freq_terms(
        text.var, 
        top = top, 
        at.least = at.least, 
        stopwords = stopwords, extend = extend
    )
    
    ## Marker with top 15 words
    out <- discourse_connector(text.var, grouping.var,
        names = names,
        regex =  setNames(list(
            binder(topterms[[1]], ignore.case = ignore.case, 
                left = left, right = right)
        ), names),
        terms = setNames(list(
            qdap::spaste(topterms[[1]])
        ), names), elim.old = elim.old,
    )
    out[["counts"]] <- termco_group_name_replace(out[["counts"]], group.nms)
    attributes(out)[["meta"]][["group.nms"]] <- group.nms
    out
}

