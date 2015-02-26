#' Extract Discourse Connectors in Context
#'
#' Extract discourse connectors in context.  This is the flexible default template 
#' for modular use in specific discourse connector functions.
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
#' 1) and right (element 2) boundary markers to use to highlight the 
#' discourse connectors.  Use \code{c("", "")} to not mark the discourse 
#' connectors.
#' @param name A string indicating the name to search for within the internal 
#' data sets, typically the function's name.  Generally, for internal use.
#' @param \ldots Other arguments passed to \code{\link[qdap]{termco}}.
#' @return Returns returns a list of 2-3: 
#' \item{counts}{A \code{\link[qdap]{termco}} object of discourse connector counts.} 
#' \item{Context 1}{A \code{\link[qdap]{trans_context}} object of the discourse connectors in context.  Note the name of this object is supplied by \code{names} element one.} 
#' \item{Context 2...n}{An optional (not returned if \code{regex} is of length one) \code{\link[qdap]{trans_context}} object of the discourse connectors in context.  Note the name of this (these) object(s) is supplied by \code{names} element 2...n.} 
#' @references Kalajahi, S. A. R., Abdullah, A. N., Mukundan, J., & Tannacito, D. J. (2012) \href{http://goo.gl/eS0OwV}{Discourse connectors: An overview of the history, definition and classification of the term}. \emph{World Applied Sciences Journal, 19}(11), 1659-1673.
#' 
#' @keywords discourse connector
#' @export
#' @importFrom qdap trans_context termco
#' @seealso \code{\link[qdap]{termco}},
#' \code{\link[qdap]{trans_context}}
#' @rdname discourse_connector
#' @include utils.R is.isolate.R is.first_in_set.R is.within_n_preceding_words.R internal_data_bases_list.R internal_data_regex_list.R internal_data_term_list.R internal_functions_list.R
#' @examples
#' ## Marker with one type (just: "I")
#' out1 <- with(pres_debates2012[1:200, ], discourse_connector(dialogue, person,
#'     names = c("I"),
#'     regex = "\\bI('[a-z]+)*\\b",
#'     terms = list(I = c(" I ", " I'"))
#' ))
#' 
#' out1[[1]]
#' out1[[2]]
#' plot(out1)
#' 
#' ## Marker with two types (both: "I" & "you")
#' out2 <- with(pres_debates2012[1:200, ], discourse_connector(dialogue, person,
#'     names = c("I", "you"),
#'     regex =  list(
#'         I = "I('[a-z]+)*\\b",
#'         you = "(\\b[Yy]ou('[a-z]+)*\\b)"
#'     ),
#'     terms = list(
#'         I = c(" I ", " I'"),
#'         you = c(" you ", " you'")
#'     )
#' ))
#' out2[[1]]
#' out2[[2]]
#' out2[[3]]
#' 
#' ## Save externally use .doc or .txt
#' ## print(out2[[2]], file="you_I.doc")
#' 
#' ## Key Words in Context
#' ## Determine top 15 words
#' topterms <- qdap::freq_terms(
#'     qdap::pres_debates2012[["dialogue"]], 
#'     top = 20, 
#'     at.least = 5, 
#'     stopwords = c(qdapDictionaries::contractions[[1]], qdapDictionaries::Top200Words)
#' )
#' 
#' ## Marker with top 15 words
#' out3 <- with(pres_debates2012, discourse_connector(dialogue, person,
#'     names = c("top15"),
#'     regex =  list(
#'         top15 = qdapRegex::pastex(qdapRegex::group(qdapRegex::bind(topterms[[1]])))
#'     ),
#'     terms = list(
#'         top15 = qdap::spaste(topterms[[1]])
#'     )
#' ))
#' out3[[1]]
#' out3[[2]]
#' plot(out3)
discourse_connector <- function(text.var, grouping.var, n.before = 1, tot = FALSE, 
    n.after = n.before, ord.inds = TRUE, markup = c("<<", ">>"), 
    name = NULL, ...){

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
    
    discmark_helper(text.var = text.var, grouping.var = grouping.var, 
        n.before = n.before, tot = tot, n.after = n.after, ord.inds = ord.inds, 
        markup = markup, names = names, terms = terms, regex = regex, 
        group.nms = group.nms, myargs = myargs)

}


discmark_helper <- function(text.var, grouping.var, n.before = 1, tot, 
    n.after = n.before, ord.inds, markup, names, terms, regex, markup.regex, 
    group.nms, myargs) {


    ## Counts (termco)
    if (!identical(myargs, structure(list(), .Names = character(0)))){
        myargs[["text.var"]] <- text.var
        myargs[["grouping.var"]] <- grouping.var
        myargs[["match.list"]] <- terms
        counts <- do.call(qdap::termco, myargs)
    } else {
        counts <- qdap::termco(text.var, grouping.var, terms)
    }
    
    ## correct group var names
    counts <- termco_group_name_replace(
        x = counts,
        nms = group.nms
    )
    
    ## Create marked transcript excerpts 
    out2 <- lapply(regex, function(x){
        inds <- grep(x, text.var) 
        
        ## make sure there are matches for the regex
        if (identical(inds, integer(0))) {
            message(sprintf("The following regex did not return any indices:\n\n%s", x))
            return(NULL)
        }        
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
    attributes(output)[["meta"]] <- list2env(list(text.var = text.var, 
        grouping.var = grouping.var, terms = terms, group.nms = group.nms))
    output
}


#' Prints an discourse_connector Object
#' 
#' Prints an discourse_connector object.
#' 
#' @param x The discourse_connector object.
#' @param \ldots ignored.
#' @method print discourse_connector
#' @export
print.discourse_connector <- function(x, ...) {
    attributes(x)[["meta"]] <- NULL
    class(x) <- "list"
    print(x)
}





#' Plots a discourse_connector Object
#' 
#' Plots a discourse_connector object.
#' 
#' @param x The discourse_connector object.
#' @param grouping.var The grouping variables.  Take from \code{x} unless 
#' supplied by the user.
#' @param plot logical.  If \code{TRUE} the plot will automatically plot. The 
#' user may wish to set to \code{FALSE} for use in \pkg{knitr}, \pkg{sweave}, 
#' etc. to add additional plot layers.
#' @param unlist.terms logical.  If \code{TRUE} the terms will be separated rather than grouped as a single (sub)marker.
#' @param \ldots Other arguments passed to \code{\link[qdap]{dispersion_plot}}.
#' @method plot discourse_connector
#' @export
plot.discourse_connector <- function(x, grouping.var = NULL, 
    unlist.terms = TRUE, plot = TRUE, ...){

    dat <- as.list.environment(attributes(x)[["meta"]])
    dat[["terms"]] <- lapply(dat[["terms"]], function(x){
        gsub("^~+|~+$", " ", gsub("\\s", "~~", tolower(x)))
    })

    if (isTRUE(unlist.terms)){
        dat[["terms"]] <- unlist(dat[["terms"]], use.names=FALSE)
    }
    if (!is.null(grouping.var)) {
        dat[["grouping.var"]] <- grouping.var

        ## Grab the grouping variable name
        if (is.list(grouping.var)) {
            m <- unlist(as.character(substitute(grouping.var))[-1])
            m <- sapply(strsplit(m, "$", fixed=TRUE), function(x) {
                    x[length(x)]
                }
            )
            dat[["group.nms"]] <- paste(m, collapse="&")
        } else {
            G <- as.character(substitute(grouping.var))
            dat[["group.nms"]] <- G[length(G)]
        }

    }
   
    out <- with(dat, qdap::dispersion_plot(match.terms = terms, 
        grouping.var = grouping.var, text.var = text.var, plot = FALSE, ...)) +
        ggplot2::ylab(paste(sapply(unlist(strsplit(dat[["group.nms"]], 
             "\\&")), Caps), collapse = " & "))
    if (isTRUE(plot)) {
        print(out)
    }
    return(invisible(out))
}



