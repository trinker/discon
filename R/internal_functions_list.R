#' @include is.isolate.R utils.R is.within_n_preceding_words.R is.first_in_set.R internal_data_bases_list.R
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
    ),
    comparison = list(
        fun4 = function(x) qdap::mgsub(search_comp, replace_comp, x, fixed=FALSE)
    ),
    test.discon = list(
        fun1 = hijack(is.within_n_preceding_words, regex.term = "((am)|(want)|(will)|(don't))"),
        fun2 = function(x, prop.true = .5 ) {
            set.seed(10)
            sample(c(TRUE, FALSE), length(x), TRUE, c(prop.true, 1 - prop.true))
        },
        fun3 = function(x, a = "") {gsub("[aeiouy]", a, x)},
        fun4 = function(x, b = "<<test>>") {gsub("s", b, x)}    
    )
)

