#' Extract Revision Discourse Connectors in Context
#'
#' \code{dc_revision} - Extract revision discourse connectors in context.
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
#' 1) and right (element 2) boundary markers to use to highlight the revision 
#' discourse connectors.  Use \code{c("", "")} to not mark the revision discourse 
#' markers.
#' @param name A string indicating the name to search for within the internal 
#' data sets, typically the function's name.  Generally, for internal use.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @return \code{dc_revision} - Returns returns a list of 2: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of revision discourse connector counts.} 
#' \item{revision}{A \code{\link[qdap]{trans_context}} object of revision discourse connectors in context.}  
#' @references Alemany, L. A. (2005). Representing discourse for automatic text summarization via shallow NLP techniques (Unpublished doctoral dissertation). Universitat de Barcelona, Barcelona.
#' 
#' \url{http://russell.famaf.unc.edu.ar/~laura/shallowdisc4summ/discmar}
#' 
#' @keywords revision 
#' @export
#' @include utils.R discourse_connector.R 
#' @importFrom qdap trans_context termco
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}}
#' @rdname dc_revision
#' @examples
#' out <- with(pres_debates2012[1:200, ], dc_revision(dialogue, person))
#' out[1]
#' out[2]
#' plot(out)
#' 
#' ## Save externally use .doc or .txt
#' ## print(out[[2]], file="revision_causality.doc")
dc_revision <- hijack(discourse_connector, name = "revision")










