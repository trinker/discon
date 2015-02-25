#' Extract Filled Pause Discourse Connectors in Context
#'
#' Extract filled pause discourse connectors in context.
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
#' 1) and right (element 2) boundary markers to use to highlight the filled pause 
#' discourse connectors.  Use \code{c("", "")} to not mark the filled pause discourse 
#' markers.
#' @param name A string indicating the name to search for within the internal 
#' data sets, typically the function's name.  Generally, for internal use.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @return Returns returns a list of 2: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of filled pause discourse marker counts.} 
#' \item{filled_pause}{A \code{\link[qdap]{trans_context}} object of filled pause discourse connectors in context.} 
#' @references Ward, N. (2000, October). \href{http://www.aclweb.org/anthology/W00-1004}{Issues in the Transcription of English Conversational Grunts}. \emph{Proceedings of the 1st SIGdial Workshop on Discourse and Dialogue} (pp. 29-35). Hong Kong: Association for Computational Linguistics.  Retrieved from \url{http://www.aclweb.org/anthology/W00-1004}
#' 
#' Linguistic Data Consortium. (2004) \href{http://www.itl.nist.gov/iad/mig/tests/rt/2004-fall/docs/SimpleMDE_V6.2-draft.pdf}{\emph{Simple metadata annotation specification (MDE)}}. University of Pennsylvania.  Retrieved from \url{http://www.itl.nist.gov/iad/mig/tests/rt/2004-fall/docs/SimpleMDE_V6.2-draft.pdf}
#'
#' @keywords filled pause 
#' @export
#' @include utils.R discourse_connector.R
#' @importFrom qdap trans_context termco
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}}
#' @rdname dc_filled_pause
#' @examples
#' out <- with(pres_debates2012[1:2000, ], dc_filled_pause(dialogue, person))
#' out[1]
#' out[2]
#' plot(out)
#' 
#' ## Save externally use .doc or .txt
#' ## print(out[[2]], file="filled_pause.doc")
dc_filled_pause <- hijack(discourse_connector, name = "filled_pause")








