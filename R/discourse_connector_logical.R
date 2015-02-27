#' @section Functions: \code{discourse_connector_logical} can take 4 different 
#' functions (as arguments passed to ellipsis) that perform logical checks or 
#' alter text variables before transcript sectioning & graphics are generated 
#' from the text.  Typically, these functions are used internally but are 
#' documented here:
#' \itemize{
#' \item \bold{fun1} - A function that checks the text variable and returns a logical vector.  This allows for additional restrictions to be placed upon the text beyond the limited (non-regex) capabilities of \code{\link[qdap]{termco}} and \code{\link[qdap]{trans_context}}.
#' \item \bold{fun2} - A function that checks the grouping variable and returns a logical vector.  This allows for additional restrictions to be placed upon the grouping variables that can't be addressed by \code{\link[qdap]{termco}} and \code{\link[qdap]{trans_context}}.
#' \item \bold{fun3} - A function that alters the text variable for the creation of transcripts sections (see \code{\link[qdap]{trans_context}}) & graphic visualizations of the data (including the generic pot method).
#' \item \bold{fun4} - A function that alters the text variable for the creation of graphic visualizations of the data only (including the generic pot method).
#' }
#' @export
#' @rdname discourse_connector
discourse_connector_logical <- function(text.var, grouping.var, n.before = 1, 
    tot = FALSE, n.after = n.before, ord.inds = TRUE, markup = c("<<", ">>"), 
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
        fun1 <- fun_list[[name]][["fun1"]]
        fun2 <- fun_list[[name]][["fun2"]]
        fun3 <- fun_list[[name]][["fun3"]]        
        fun4 <- fun_list[[name]][["fun4"]]           
    } else { 
        ## Grab elements from ellipsis &
        ## remove the function control specific 
        ## arguments from dots
        regex <- myargs[["regex"]]
        names <- myargs[["names"]]
        terms <- myargs[["terms"]]
        fun1 <- myargs[["fun1"]]
        fun2 <- myargs[["fun2"]] 
        fun3 <- myargs[["fun3"]]
        fun4 <- myargs[["fun4"]]        
        myargs[c("regex", "names", "terms", "fun1", "fun2", "fun3", "fun4")] <- NULL
    }

    control <- NULL
    if (!is.null(myargs[["control"]])){
        control <- myargs[["control"]]
        myargs[["control"]] <- NULL

        if (!is.null(fun1)){
            fun1 <- elli(fun1, myargs = control)
        }

        if (!is.null(fun2)){
            fun2 <- elli(fun2, myargs = control)
        }

        if (!is.null(fun3)){
            fun3 <- elli(fun3, myargs = control)
        }
        if (!is.null(fun4)){
            fun4 <- elli(fun4, myargs = control)
        }        
    }

    stopifnot(length(markup) == 2)

    inds2keep <- rep(TRUE, length(text.var))
    ## user supplied function to produce logical vector
    if (!is.null(fun1)) {    
        inds2keep <- fun1(text.var)
        ## return NULL right away if `fun1` is too restrictive.
        if (!any(inds2keep)) {
            message("No elemements in `text.var` meet the criteria of `fun1`.")
            return(NULL)
        }
    }
    ## Optional user supplied function to produce logical vector for group.vars   
    if (!is.null(fun2)) {
        if (is.list(grouping.var) & length(grouping.var) > 1) {
            grouping <- qdap::paste2(grouping.var)
        } else {
            grouping <- unlist(grouping.var)
        }        
        inds2keep <- fun2(grouping) & inds2keep       
    }
    ## return NULL right away if `fun1/2` is too restrictive.
    if (!any(inds2keep)) {
        message("No elemements in `grouping.var` meet the criteria of `fun1` & `fun2`.")
        return(NULL)
    }
    
    if (all(sapply(list(fun1, fun2, fun3, fun4), is.null))){
        discmark_helper(text.var = text.var, grouping.var = grouping.var, 
            n.before = n.before, tot = tot, n.after = n.after, ord.inds = ord.inds, 
            markup = markup, names = names, terms = terms, regex = regex, 
            group.nms = group.nms, myargs = myargs)        
    } else {
        discmark_helper_logical(text.var = text.var, grouping.var = grouping.var, 
            n.before = n.before, tot = tot, n.after = n.after, ord.inds = ord.inds, 
            markup = markup, names = names, terms = terms, regex = regex, 
            group.nms = group.nms, myargs = myargs, inds2keep = inds2keep, 
            fun3 = fun3, fun4 = fun4)
    }

}

discmark_helper_logical <- function(text.var, grouping.var, n.before = 1, tot, 
    n.after = n.before, ord.inds, markup, names, terms, regex, markup.regex, 
    group.nms, myargs, inds2keep, fun3, fun4) {

    ### Replicate text.var to text.var2 and allow funs 1-3 to act 
    if (!is.null(fun3)){
        text.var <- fun3(text.var)
    }    
    text.var2 <- text.var
    if (!is.null(fun4)){
        text.var2 <- fun4(text.var2)
    }     
    ## replace non-space chararacters with 'x' if restricted by `fun` or `fun2`
    text.var2[!inds2keep & !is.na(inds2keep)] <- gsub("[^ ]", "x", text.var2[!inds2keep & !is.na(inds2keep)])

    ## Counts (termco)
    if (!identical(myargs, structure(list(), .Names = character(0)))){
        myargs[["text.var"]] <- text.var2
        myargs[["grouping.var"]] <- grouping.var
        myargs[["match.list"]] <- terms
        counts <- do.call(qdap::termco, myargs)
    } else {
        counts <- qdap::termco(text.var2, grouping.var, terms)
    }
    
    ## correct group var names
    counts <- termco_group_name_replace(
        x = counts,
        nms = group.nms
    )

    if (is.logical(inds2keep)) inds2keep <- which(inds2keep)
    
    ## Create marked transcript excerpts 
    out2 <- lapply(regex, function(x){

        inds <- grep(x, text.var) 
        if (identical(inds, integer(0))) {
            message(sprintf("The following regex did not return any indices:\n\n%s", x))
            return(NULL)
        }
         
        text.var[!inds2keep & !is.na(inds2keep)] <- NA
        out1 <- qdap::trans_context(text.var = text.var, grouping.var = grouping.var, 
            inds = intersect(inds, inds2keep), n.before = n.before, tot = tot, 
            n.after = n.after, ord.inds = ord.inds)
   
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
    attributes(output)[["meta"]] <- list2env(list(text.var = text.var2, 
        grouping.var = grouping.var, terms = terms, group.nms = group.nms))
    output
}
