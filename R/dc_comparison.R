#' Extract Comparison Discourse Connectors in Context
#'
#' Extract comparison discourse connectors in context.
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
#' 1) and right (element 2) boundary markers to use to highlight the comparison 
#' discourse connectors.  Use \code{c("", "")} to not mark the comparison discourse 
#' markers.
#' @param name A string indicating the name to search for within the internal 
#' data sets, typically the function's name.  Generally, for internal use.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @return Returns returns a list of 2: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of comparison discourse marker counts.} 
#' \item{comparison}{A \code{\link[qdap]{trans_context}} object of comparison discourse connectors in context.} 
#' @references Kalajahi, S. A. R., Abdullah, A. N., Mukundan, J., & Tannacito, D. J. (2012) \href{http://goo.gl/eS0OwV}{Discourse connectors: An overview of the history, definition and classification of the term}. \emph{World Applied Sciences Journal, 19}(11), 1659-1673.
#' 
#' @keywords comparison compare
#' @export
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}}
#' @rdname dc_comparison
#' @include utils.R internal_data_bases_list.R internal_data_regex_list.R internal_data_term_list.R
#' @examples
#' out <- with(pres_debates2012[1:200, ], dc_comparison(dialogue, person))
#' out[1]
#' out[2]
#' plot(out)
#' 
#' ## Save externally use .doc or .txt
#' ## print(out[[2]], file="comparison.doc")
dc_comparison <- function(text.var, grouping.var, n.before = 1, tot = FALSE, 
    n.after = n.before, ord.inds = TRUE, markup = c("<<", ">>"), 
    name = "comparison", ...){

    ## Grab the grouping variable name
    if (is.list(grouping.var)) {
        m <- unlist(as.character(substitute(grouping.var))[-1])
        m <- sapply(strsplit(m, "$", fixed=TRUE), function(x) {
                x[length(x)]
            }
        )
        group.nms <- paste(m, collapse="&")
    } else {
        G <- as.character(substitute(grouping.var))
        group.nms <- G[length(G)]
    }
    
    ## Either grab the regex, names, and terms 
    ## from the internal source or grab elements  
    ## from the ellipsis
    myargs <- list(...)
    if (!is.null(name)){
        terms <- term_list[[name]]
        regex <- regex_list[[name]]
        if (length(regex) > 1) {
            names <- names(regex)        
        } else {
            names <- name
        }    
    }else { 
        ## Grab elements from ellipsis &
        ## remove the function control specific 
        ## arguments from dots
        regex <- myargs[["regex"]]
        names <- myargs[["names"]]
        terms <- myargs[["terms"]]
        myargs[c("regex", "names", "terms", "markup.regex")] <- NULL
    }

    stopifnot(length(markup) == 2)
    
    discmark_helper_special(text.var = text.var, grouping.var = grouping.var, 
        n.before = n.before, tot = tot, n.after = n.after, ord.inds = ord.inds, 
        markup = markup, names = names, terms = terms, regex = regex, 
        group.nms = group.nms, myargs = myargs)

}


discmark_helper_special <- function(text.var, grouping.var, n.before = 1, tot, 
    n.after = n.before, ord.inds, markup, names, terms, regex, markup.regex, 
    group.nms, myargs) {

    if (!identical(terms, term_list[["comparison"]])){
        warning("`dc_comparison` is a modified version of `discourse_connectors`; results may be incorrect")
    }
    
    termco_terms <- qdap::mgsub(search_comp, replace_comp, text.var, fixed=FALSE)
    ## Counts (termco)
    if (!identical(myargs, structure(list(), .Names = character(0)))){
        myargs[["text.var"]] <- termco_terms
        myargs[["grouping.var"]] <- grouping.var
        myargs[["match.list"]] <- terms
        counts <- do.call(qdap::termco, myargs)
    } else {
        counts <- qdap::termco(termco_terms, grouping.var, terms)
    }
    
    ## correct group var names
    counts <- termco_group_name_replace(
        x = counts,
        nms = group.nms
    )
    
    ## Create marked transcript excerpts 
    out2 <- lapply(regex, function(x){
        inds <- grep(x, text.var) 
        out1 <- qdap::trans_context(text.var = text.var, grouping.var = grouping.var, 
            inds = inds, n.before = n.before, tot = tot, n.after = n.after, 
            ord.inds = ord.inds)
   
        out1[out1[["event"]], "text"] <- gsub(
            sprintf("(%s)", x), 
            paste0(markup[1], "\\1", markup[2]), out1[out1[["event"]], "text"]
        )   
        out1
    })

    ## Flatten the list
    output <- setNames(unlist(list(list(counts), out2), recursive=FALSE), 
        c("counts", names))    
    
    class(output) <- "discourse_connector"
    attributes(output)[["meta"]] <- list2env(list(text.var = termco_terms, 
        grouping.var = grouping.var, terms = terms, group.nms = group.nms))
    output
}

