#' Extract Comparison Discourse Connectors in Context
#'
#' Extract comparison discourse connectors in context.
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
#' 1) and right (element 2) boundary markers to use to highlight the comparison 
#' discourse connectors.  Use \code{c("", "")} to not mark the comparison discourse 
#' markers.
#' @param name A string indicating the name to search for within the internal 
#' data sets, typically the function's name.  Generally, for internal use.
#' @param fun1 A function that checks the text variable and returns a logical 
#' vector.  This allows for additional restrictions to be places upon the text
#' beyond the limited (non-regex) capabilities of \code{\link[qdap]{termco}} and 
#' \code{\link[qdap]{trans_context}}.  This argument in \code{dc_oh_begin} is 
#' ignored.
#' @param fun2 A function that checks the grouping variable and returns a logical 
#' vector.  This allows for additional restrictions to be placed upon the 
#' grouping variables that can't be addressed by \code{\link[qdap]{termco}} and 
#' \code{\link[qdap]{trans_context}}.  This argument in \code{dc_oh_begin} is 
#' ignored.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @return Returns returns a list of 2: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of comparison discourse marker counts.} 
#' \item{comparison}{A \code{\link[qdap]{trans_context}} object of comparison discourse connectors in context.} 
#' @references Kalajahi, S. A. R., Abdullah, A. N., Mukundan, J., & Tannacito, D. J. (2012) \href{http://goo.gl/eS0OwV}{Discourse connectors: An overview of the history, definition and classification of the term}. \emph{World Applied Sciences Journal, 19}(11), 1659-1673.
#' 
#' @keywords comparison compare
#' @export
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}}
#' @rdname dc_comparison
#' @include utils.R internal_data_bases_list.R internal_data_regex_list.R internal_data_term_list.R
#' @examples
#' out <- with(pres_debates2012[1:200, ], dc_comparison(dialogue, person))
#' out[1]
#' out[2]
#' plot(out)
#' 
#' ## Save externally use .doc or .txt
#' ## print(out[[2]], file="comparison.doc")
dc_comparison <- hijack(discourse_connector_logical, name = "comparison")