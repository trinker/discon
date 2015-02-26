#' Extract Connective Discourse Connectors in Context
#'
#' \code{dc_connective} - Extract connective discourse connectors (i.e., "and", 
#' "but", & "or" collectively termed discourse connectives (Schiffrin, 1987)) in 
#' context.
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
#' 1) and right (element 2) boundary markers to use to highlight the connective 
#' discourse connectors.  Use \code{c("", "")} to not mark the connective discourse 
#' markers.
#' @param name A string indicating the name to search for within the internal 
#' data sets, typically the function's name.  Generally, for internal use.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @return \code{dc_connective} - Returns returns a list of 2: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of connective discourse connector counts.} 
#' \item{connective}{A \code{\link[qdap]{trans_context}} object of connective discourse connectors in context.}  
#' @references Schiffrin, D. (1987). \emph{Discourse markers}.  (pp. 128-190). London: Cambridge University Press.   
#' 
#' @keywords connective 
#' @export
#' @include utils.R discourse_connector.R 
#' @importFrom qdap trans_context termco
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}}
#' @rdname dc_connective
#' @examples
#' out <- with(pres_debates2012[1:200, ], dc_connective(dialogue, person))
#' out[1]
#' out[2]
#' plot(out)
#' 
#' ## Save externally use .doc or .txt
#' ## print(out[[2]], file="connective_causality.doc")
dc_connective <- hijack(discourse_connector, name = "connective")



#' \code{dc_connective_sub} - Extract connective discourse connectors ("and", 
#' "but", & "or") in context.
#' 
#' @export
#' @rdname dc_connective
#' @return \code{dc_connective_sub} - Returns returns a list of 4: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of connective discourse connector counts.} 
#' \item{and}{A \code{\link[qdap]{trans_context}} object of "and" discourse connectors in context.}  
#' \item{but}{A \code{\link[qdap]{trans_context}} object of "but" discourse connectors in context.}
#' \item{or}{A \code{\link[qdap]{trans_context}} object of "or" discourse connectors in context.}
dc_connective_sub <- hijack(discourse_connector, name = "connective_sub")






