#' Extract Backchannel Discourse Connectors in Context
#'
#' Extract backchannel discourse connectors in context.
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
#' 1) and right (element 2) boundary markers to use to highlight the backchannel 
#' discourse connectors.  Use \code{c("", "")} to not mark the backchannel discourse 
#' markers.
#' @param name A string indicating the name to search for within the internal 
#' data sets, typically the function's name.  Generally, for internal use.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @details Backchannels are typically a listener indicating that they are 
#' listening and yielding the floor to the speaker.  Such utterances are rarely 
#' less than a few words.  
#' 
#' An internal function checks that a line contains a 
#' maximum of three words to be considered.  This can be changed by supplying an 
#' argument to \code{max} via \code{control}.  For example to set the number of 
#' words to 5, use: \code{control = list(max = 2))}. Additionally, a second 
#' internal function ensures that the speaker's turn is at max one row (1 
#' sentence if \code{\link[qdap]{sentSplit}} has been used).
#' @return Returns returns a list of 2: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of backchannel discourse marker counts.} 
#' \item{backchannel}{A \code{\link[qdap]{trans_context}} object of backchannel discourse connectors in context.} 
#' @references Ward, N. (2000, October). \href{http://www.aclweb.org/anthology/W00-1004}{Issues in the Transcription of English Conversational Grunts}. \emph{Proceedings of the 1st SIGdial Workshop on Discourse and Dialogue} (pp. 29-35). Hong Kong: Association for Computational Linguistics.  Retrieved from \url{http://www.aclweb.org/anthology/W00-1004}
#' 
#' Linguistic Data Consortium. (2004) \href{http://www.itl.nist.gov/iad/mig/tests/rt/2004-fall/docs/SimpleMDE_V6.2-draft.pdf}{\emph{Simple metadata annotation specification (MDE)}}. University of Pennsylvania.  Retrieved from \url{http://www.itl.nist.gov/iad/mig/tests/rt/2004-fall/docs/SimpleMDE_V6.2-draft.pdf}
#'
#' @keywords backchannel 
#' @export
#' @include utils.R discourse_connector_logical.R discourse_connector.R is.isolate.R
#' @importFrom qdap trans_context termco
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}}
#' @rdname dc_backchannel
#' @examples
#' out <- with(pres_debates2012[1:2000, ], dc_backchannel(dialogue, person))
#' out[1]
#' out[2]
#' plot(out)
#' 
#' ## Save externally use .doc or .txt
#' ## print(out[[2]], file="backchannel.doc") 
dc_backchannel <- hijack(discourse_connector_logical, name = "backchannel")




