#' Extract Well Discourse Connectors in Context
#'
#' \code{dc_well} - Extract well discourse connectors (a marker Schiffrin (1987)
#' terms a marker of response) in context.
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
#' 1) and right (element 2) boundary markers to use to highlight the well 
#' discourse connectors.  Use \code{c("", "")} to not mark the well discourse 
#' markers.
#' @param name A string indicating the name to search for within the internal 
#' data sets, typically the function's name.  Generally, for internal use.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @details Broadly "well" is a ``marker of response'' (Schiffrin, 1987, p. 102).
#' Interesty, "wel" is often used in response to a question as a means of 
#' providing an answer outside of the expected answer of the question asker.  For
#' example, \emph{Are you hungry?}  Here the questioner expcts a yes no answer.
#' A responder may retort, \emph{Well I am but I don't want fish.}  The response
#' provides information that the respondant knows to be beyond the expected 
#' response.  Following these types of responses may lead to additional 
#' information the respondant wihes to convey but has not been given the floor 
#' for elaboration.  Well may be used in a contingent answer as well.  For 
#' example: \cr \cr
#' \emph{John: Do you like Chinese?} \cr
#' \emph{Sean: Yes.} \cr
#' \emph{John: \bold{Well} there's a new place called...} 
#' 
#' An internal function in \code{dc_well_begin} ensures that each has no more 
#' than n words before the "well".  The defaut number of words is 0 or less.  
#' This can be changed by supplying an \code{n} argument to 
#' \code{\link[discon]{is.within_n_preceding_words}} via \code{control}.  For 
#' example to set the number of words to 2, use: \code{control = list(n = 2))}.  
#' The user could change both arguments via: \cr
#' \code{control = list(n = 1, regex.term = "Well"))}
#' 
#' Additionally, another internal function, \code{\link[discon]{is.first_in_set}}
#' checks to ensure that the occurrence of well is the first sentence in that 
#' group (\code{grouping.var}) turn of talk.  
#' @return Returns returns a list of 2: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of well discourse marker counts.} 
#' \item{well}{A \code{\link[qdap]{trans_context}} object of well discourse connectors in context.} 
#' @references Schiffrin, D. (1987). \emph{Discourse markers}.  (pp. 102-127). London: Cambridge University Press.   
#' 
#' @keywords well 
#' @export
#' @include utils.R is.isolate.R is.within_n_preceding_words.R internal_data_bases_list.R internal_data_regex_list.R internal_data_term_list.R internal_functions_list.R
#' @importFrom qdap trans_context termco
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}}
#' @rdname dc_well
#' @examples
#' out <- with(pres_debates2012[1:1000, ], dc_well(dialogue, person))
#' out[1]
#' out[2]
#' plot(out)
#' 
#' ## Save externally use .doc or .txt
#' ## print(out[[2]], file="well.doc")
dc_well <- hijack(discourse_connector, name = "well")

#' Extract well Discourse Connectors in Context
#'
#' \code{dc_well_begin} - An extension of \code{dc_well} that requires the "well" to
#' come at the begining of the word.  
#' 
#' @export
#' @rdname dc_well
dc_well_begin <- hijack(discourse_connector_logical, name = "well")




