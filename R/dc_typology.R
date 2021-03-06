#' Extract Typology Discourse Connectors in Context
#'
#' Extract typology discourse connectors in context.
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
#' 1) and right (element 2) boundary markers to use to highlight the typology 
#' discourse connectors.  Use \code{c("", "")} to not mark the typology discourse 
#' markers.
#' @param name A string indicating the name to search for within the internal 
#' data sets, typically the function's name.  Generally, for internal use.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @return Returns returns a list of 3: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of positive and negative typology discourse marker counts.} 
#' \item{negative}{A \code{\link[qdap]{trans_context}} object of positive typology discourse connectors in context.} 
#' \item{positive}{A \code{\link[qdap]{trans_context}} object of negative typology discourse connectors in context.} 
#' @references Ryan, G. W. & Bernard, H. R. (2003). \href{http://goo.gl/KdYxB8}{Techniques to identify themes}. \emph{Field Methods. 15}(1), 85-109. doi: \href{http://fmx.sagepub.com/content/15/1/85}{10.1177/1525822X02239569}
#' 
#' @keywords typology category define taxonomy
#' @export
#' @include utils.R discourse_connector.R
#' @importFrom qdap trans_context termco
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}}
#' @rdname dc_typology
#' @examples
#' out <- with(pres_debates2012[1:200, ], dc_typology(dialogue, person))
#' out[1]
#' out[2]
#' out[3]
#' plot(out)
#' 
#' ## Save externally use .doc or .txt
#' ## print(out[[2]], file="neg_typology.doc")
dc_typology <- hijack(discourse_connector, name = "typology")








