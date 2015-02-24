#' Extract Causality Discourse Connectors in Context
#'
#' \code{dc_causality} - Extract causality discourse connectors in context.
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
#' 1) and right (element 2) boundary markers to use to highlight the causality 
#' discourse connectors.  Use \code{c("", "")} to not mark the causality discourse 
#' markers.
#' @param name A string indicating the name to search for within the internal 
#' data sets, typically the function's name.  Generally, for internal use.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @return \code{dc_causality} - Returns returns a list of 2: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of causality discourse connector counts.} 
#' \item{causality}{A \code{\link[qdap]{trans_context}} object of causality discourse connectors in context.}  
#' @references Alemany, L. A. (2005). Representing discourse for automatic text summarization via shallow NLP techniques (Unpublished doctoral dissertation). Universitat de Barcelona, Barcelona.
#' 
#' \url{http://russell.famaf.unc.edu.ar/~laura/shallowdisc4summ/discmar}
#' 
#' @keywords causality 
#' @export
#' @include utils.R internal_data_bases_list.R internal_data_regex_list.R internal_data_term_list.R discourse_connector.R 
#' @importFrom qdap trans_context termco
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}}
#' @rdname dc_causality
#' @examples
#' with(pres_debates2012[1:200, ], dc_causality(dialogue, person))
#' 
#' out <- with(pres_debates2012[1:200, ], dc_causality_sub(dialogue, person))
#' out[1]
#' out[2]
#' out[3]
#' plot(out)
#' 
#' ## Save externally use .doc or .txt
#' ## print(out[[2]], file="elaboration_causality.doc")
dc_causality <- hijack(discourse_connector, name = "causality")

#' \code{dc_causality_sub} - Extract causality discourse connectors in context typified as 
#' continuation or elaboration.
#' @export
#' @rdname dc_causality
#' @return \code{dc_causality_sub} - Returns returns a list of 3: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of causality discourse connector counts.} 
#' \item{continuation}{A \code{\link[qdap]{trans_context}} object of continuation causality discourse connectors in context.}
#' \item{elaboration}{A \code{\link[qdap]{trans_context}} object of elaboration causality discourse connectors in context.}
dc_causality_sub <- hijack(discourse_connector, name = "causality_sub")








