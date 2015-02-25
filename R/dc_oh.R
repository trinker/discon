#' Extract Oh Discourse Connectors in Context
#'
#' Extract oh discourse connectors in context.
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
#' 1) and right (element 2) boundary markers to use to highlight the oh 
#' discourse connectors.  Use \code{c("", "")} to not mark the oh discourse 
#' markers.
#' @param name A string indicating the name to search for within the internal 
#' data sets, typically the function's name.  Generally, for internal use.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @return Returns returns a list of 2: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of oh discourse marker counts.} 
#' \item{oh}{A \code{\link[qdap]{trans_context}} object of oh discourse connectors in context.} 
#' @references Schiffrin, D. (1987). \emph{Discourse markers}.  (pp. 73-101). London: Cambridge University Press.   
#' 
#' @keywords oh 
#' @export
#' @include utils.R discourse_connector.R
#' @importFrom qdap trans_context termco
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}}
#' @rdname dc_oh
#' @examples
#' out <- with(pres_debates2012[1:1000, ], dc_oh(dialogue, person))
#' out[1]
#' out[2]
#' plot(out)
#' 
#' ## Save externally use .doc or .txt
#' ## print(out[[2]], file="oh.doc")
dc_oh <- hijack(discourse_connector, name = "oh")








