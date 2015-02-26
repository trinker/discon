#' @include is.isolate.R utils.R is.within_n_preceding_words.R is.first_in_set.R
fun_list <- list(
    backchannel = list(
        fun1 = function(x, max = 3){
            qdap::wc(x) <= max
        },
        fun2 = is.isolate
    ),
    oh = list(
        fun1 = hijack(is.within_n_preceding_words, regex.term = "[Oo]h"), 
        fun2 = NULL
    ),
    well = list(
        fun1 = hijack(is.within_n_preceding_words, regex.term = "[Ww]ell"), 
        fun2 = is.first_in_set
    )
)

