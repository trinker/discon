binder3 <- function(x, ignore.case = FALSE) {
    if (ignore.case){
        x <- ignore_case(x)
    }
    paste0("(", qdapRegex::pastex(x), ")")
}

regex_list <- list(
    typology = list(
        `positive` = "(\\b[A-Za-z]*(i|')s a\\b)",
        `negative` = "(((isn't)|(\\b[A-Za-z]*(i|')s not)) a(n)*\\b)"
    ),
    causality = binder(causal, ignore.case = TRUE),
    causality_sub = lapply(
        list(
            continuation = causal[1:9],
            elaboration = causal[10:15]
        ), binder, ignore.case = TRUE),
    context = binder(contextual, ignore.case = TRUE),
    context_sub = lapply(
        list(
            none = contextual[1:4],
            continuation = contextual[5:8],
            elaboration = contextual[-c(1:8)]
        ), binder, ignore.case = TRUE),    
    equality = binder(equal, ignore.case = TRUE),
    equality_sub = lapply(
        list(
            none = contextual[1:8],
            continuation = contextual[9:14],
            elaboration = contextual[-c(1:14)]
        ), binder, ignore.case = TRUE),     
    revision = binder(revise, ignore.case = TRUE),
    negator = binder3(unlist(negators, use.names=FALSE)),
    negator_sub = negators,
    timing = binder(time_terms, ignore.case = TRUE, right=""),
    comparison = qdapRegex::pastex(qdapRegex::group(comp_regex))
)


