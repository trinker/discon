#' Extract Context Discourse Connectors in Context
#'
#' \code{dc_context} - Extract context discourse connectors in context.
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
#' 1) and right (element 2) boundary markers to use to highlight the context 
#' discourse connectors.  Use \code{c("", "")} to not mark the context discourse 
#' markers.
#' @param name A string indicating the name to search for within the internal 
#' data sets, typically the function's name.  Generally, for internal use.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @return \code{dc_context} - Returns returns a list of 2: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of context discourse connector counts.} 
#' \item{context}{A \code{\link[qdap]{trans_context}} object of context discourse connectors in context.}  
#' @references Alemany, L. A. (2005). Representing discourse for automatic text summarization via shallow NLP techniques (Unpublished doctoral dissertation). Universitat de Barcelona, Barcelona.
#' 
#' \url{http://russell.famaf.unc.edu.ar/~laura/shallowdisc4summ/discmar}
#' 
#' @keywords context 
#' @export
#' @include utils.R internal_data_bases_list.R internal_data_regex_list.R internal_data_term_list.R discourse_connector.R 
#' @importFrom qdap trans_context termco
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}}
#' @rdname dc_context
#' @examples
#' with(pres_debates2012[1:200, ], dc_context(dialogue, person))
#' 
#' out <- with(pres_debates2012[1:200, ], dc_context_sub(dialogue, person))
#' out[1]
#' out[2]
#' out[3]
#' out[4]
#' plot(out)
#' 
#' ## Save externally use .doc or .txt
#' ## print(out[[3]], file="elaboration_context.doc")
dc_context <- hijack(discourse_connector, name = "context")

#' \code{dc_context_sub} - Extract context discourse connectors in context typified as 
#' continuation or elaboration.
#' @export
#' @rdname dc_context
#' @return \code{dc_context_sub} - Returns returns a list of 4: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of context discourse connector counts.} 
#' \item{none}{A \code{\link[qdap]{trans_context}} object of context discourse connectors in context that are not \emph{continuation} or \emph{elaboration}.}
#' \item{continuation}{A \code{\link[qdap]{trans_context}} object of continuation context discourse connectors in context.}
#' \item{elaboration}{A \code{\link[qdap]{trans_context}} object of elaboration context discourse connectors in context.}
dc_context_sub <- hijack(discourse_connector, name = "context_sub")








