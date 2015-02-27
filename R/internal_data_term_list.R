#' @include utils.R internal_data_bases_list.R
term_list <- list(
    typology = list(
        `positive` = c("'s a ", " is a ", "'s an ", " is an "),
        `negative` = c("'s not a ", " is not a ", " isn't a ", 
            "'s not an ", " is not an ", " isn't an ")
    ),
    causality = list(causality = qdap::spaste(causal)),
    causality_sub = 
        lapply(
            list(
                continuation = causal[1:9],
                elaboration = causal[10:15]
            ), qdap::spaste
        ),
    context = list(context = qdap::spaste(contextual)),
    context_sub = 
        lapply(
            list(
                none = contextual[1:4],
                continuation = contextual[5:8],
                elaboration = contextual[-c(1:8)]
            ), qdap::spaste
        ), 
    equality = list(equality = qdap::spaste(contextual)),
    equality_sub = 
        lapply(
            list(
                none = contextual[1:8],
                continuation = contextual[9:14],
                elaboration = contextual[-c(1:14)]
            ), qdap::spaste
        ),       
    revision = list(revision = qdap::spaste(revise)),
    negator = list(negators = unlist(negators_terms, use.names=FALSE)),
    negator_sub = negators_terms,
    timing = list(timing = time_terms),
    comparison = list(comparison = com_terms),
    filled_pause = list(filled_pause = qdap::spaste(filled_pause_terms)),
    backchannel = list(backchannel = qdap::spaste(backchannel_terms)),
    oh = list(oh = " oh "),
    well = list(well = " well "),
    connective = list(connectives = c(" and ", " but ", " or ")),
    connective_sub = list(
        and = " and ",
        but = " but ",
        or = " or "
    ),
    test.discon = list(ae = c("a", "e"))
)



