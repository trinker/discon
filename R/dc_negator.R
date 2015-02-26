#' Extract Negator Discourse Connectors in Context
#'
#' \code{dc_negator} - Extract negator discourse connectors in context.
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
#' 1) and right (element 2) boundary markers to use to highlight the negator 
#' discourse connectors.  Use \code{c("", "")} to not mark the negator discourse 
#' markers.
#' @param name A string indicating the name to search for within the internal 
#' data sets, typically the function's name.  Generally, for internal use.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @return \code{dc_negator} - Returns returns a list of 2: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of negator discourse connector counts.} 
#' \item{negative_words}{A \code{\link[qdap]{trans_context}} object of negative words (e.g., not, no, none, never) discourse connectors in context.}  
#' @references Ryan, G. W. & Bernard, H. R. (2003). \href{http://goo.gl/KdYxB8}{Techniques to identify themes}. \emph{Field Methods. 15}(1), 85-109. doi: \href{http://fmx.sagepub.com/content/15/1/85}{10.1177/1525822X02239569}
#' 
#' @keywords negator negative
#' @export
#' @include utils.R internal_data_bases_list.R internal_data_regex_list.R internal_data_term_list.R discourse_connector.R 
#' @importFrom qdap trans_context termco
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}}
#' @rdname dc_negator
#' @examples
#' with(pres_debates2012[1:200, ], dc_negator(dialogue, person))
#' 
#' out <- with(pres_debates2012[1:200, ], dc_negator_sub(dialogue, person))
#' out[1]
#' out[2]
#' out[3]
#' out[4]
#' plot(out)
#' 
#' ## Save externally use .doc or .txt
#' ## print(out[[3]], file="negator_prefix.doc")
dc_negator <- hijack(discourse_connector, name = "negator")


#' \code{dc_negator_sub} - Extract negator discourse connectors in context typified as 
#' words, prefix, or contractions (not type).
#' @export
#' @rdname dc_negator
#' @return \code{dc_negator_sub} - Returns returns a list of 4: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of negator discourse connector counts.} 
#' \item{negative_words}{A \code{\link[qdap]{trans_context}} object of negative words (e.g., not, no, none, never) discourse connectors in context.}  
#' \item{negative_prefix}{A \code{\link[qdap]{trans_context}} object of negative prefix (e.g., dis-, il-, im-, ir-, non-, un-) discourse connectors in context.  Note that in- and a- prefixes are ignored as these letters begin many non-negator words as well.}
#' \item{negative_contractions}{A \code{\link[qdap]{trans_context}} object of negative contractions discourse connectors in context.}
dc_negator_sub <- hijack(discourse_connector, name = "negator_sub")






