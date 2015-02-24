kwic <- function(text.var, grouping.var, n.before = 1, tot = FALSE, 
    n.after = n.before, ord.inds = TRUE, markup = c("<<", ">>"), top = 15,
    at.least = 5, extend = TRUE, ignore.case = FALSE, left = "\\b", right = left,
    names = c("KeyWords"), 
    stopwords = c("going", qdapDictionaries::contractions[[1]], 
        qdapDictionaries::Top200Words), ...){

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

    ## Determine top n words
    topterms <- qdap::freq_terms(
        text.var, 
        top = top, 
        at.least = at.least, 
        stopwords = stopwords, extend = extend
    )
    
    ## Marker with top 15 words
    out <- discourse_connector(text.var, grouping.var,
        names = names,
        regex =  setNames(list(
            binder(topterms[[1]], ignore.case = ignore.case, 
                left = left, right = right)
        ), names),
        terms = setNames(list(
            qdap::spaste(topterms[[1]])
        ), names)
    )
    out[["counts"]] <- termco_group_name_replace(out[["counts"]], group.nms)
    attributes(out)[["meta"]][["group.nms"]] <- group.nms
    out
}

dat <- split(pres_debates2012, pres_debates2012[["time"]])
out <- lapply(dat, function(x) with(x, kwic(dialogue, person)))
out[[1]][[1]]
lapply(out, function(x) {dev.new(); plot(x, total.color = NULL)})


out <- with(DATA, kwic(state, person))
out[[1]]
out[[2]]
plot(out)