#' Extract Timing Discourse Connectors in Context
#'
#' Extract timing discourse connectors in context.
#' 
#' @param text.var The text variable. 
#' @param grouping.var The grouping variables.  Also takes a single 
#' grouping variable or a list of 1 or more grouping variables.
#' @param inds A list of integer indices to print context for.
#' @param n.before The number of rows before the indexed occurrence.
#' @param tot logical.  If \code{TRUE} condenses sub-units (e.g., sentences) 
#' into turns of talk for that \code{grouping.var}.
#' @param n.after The number of rows after the indexed occurrence.
#' @param ord.inds logical.  If \code{TRUE} inds is ordered least to greatest.
#' @param markup A character vector of length two indicating the left (element 
#' 1) and right (element 2) boundary markers to use to highlight the timing 
#' discourse connectors.  Use \code{c("", "")} to not mark the timing discourse 
#' markers.
#' @param name A string indicating the name to search for within the internal 
#' data sets, typically the function's name.  Generally, for internal use.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @return Returns returns a list of 2: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of positive and negative timing discourse marker counts.} 
#' \item{timing}{A \code{\link[qdap]{trans_context}} object of timing discourse connectors in context.} 
#' @references Kalajahi, S. A. R., Abdullah, A. N., Mukundan, J., & Tannacito, D. J. (2012) \href{http://goo.gl/eS0OwV}{Discourse connectors: An overview of the history, definition and classification of the term}. \emph{World Applied Sciences Journal, 19}(11), 1659-1673.
#' 
#' @keywords timing time
#' @export
#' @include utils.R discourse_connector.R
#' @importFrom qdap trans_context termco
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}}
#' @rdname dc_timing
#' @examples
#' out <- with(pres_debates2012[1:200, ], dc_timing(dialogue, person))
#' out[1]
#' out[2]
#' plot(out)
#' 
#' ## Save externally use .doc or .txt
#' ## print(out[[2]], file="timing.doc")
dc_timing <- hijack(discourse_connector, name = "timing")








