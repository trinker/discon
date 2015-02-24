revise <- c("anyway", "actually", "but", "even though", "however", "in fact", 
    "it is true that", "nevertheless", "on the contrary", "the fact is", 
    "well now", "although", "despite", "except", "in spite of"
)


causal <- c("as a consequence", "for this reason", "in conclusion", "in effect", 
    "in order to", "so", "so that", "that's why", "thus", "because", 
    "because of", "due to", "given that", "in case", "thanks to"
)

contextual <- c("at the same time", "if", "no doubt", "whenever", "in any case", 
    "in that case", "then", "with respect to", "after", "as soon as", 
    "before", "between", "by means of", "considering", "during", 
    "far from", "following", "for the moment", "in accordance with", 
    "originally", "provided that", "towards", "unless", "until", 
    "when", "where", "while"
)

equal <- c("above all", "also", "besides", "even", "in short", "moreover", 
    "specially", "what's more", "but also", "by the way", "lastly", 
    "not only", "on the one hand", "on the other hand", "essentially", 
    "for example", "in comparison", "in other words", "in particular", 
    "in sum", "precisely", "specifically", "such as", "that is to say"
)

negators <- list(
        negative_words = "(\\b[Nn]((o((t)|(ne))*)|(ever))\\b)",
        negative_prefix = "(\\b([Dd]is|([Ii](l|m|r))|[Nn]on|[Uu]n)[a-z]+)", 
        negative_contractions = "(\\b(([Aa](i|re))|([Cc](a|ould))|([Dd](id|(o(es)*)))|([Hh]as)|([Ii]s)|([Mm](ight|ust))|([Ss]h(a|(hould)))|([Ww]((as)|(ere)|(o(uld)*))))n't\\b)"
)

negators_terms <- list(
    negative_words = c(" no ", " none ", " not ", "never"),
    negative_prefix = c(" dis", " il", " im", " ir", " non", " un"),
    negative_contractions = c("ain't", "aren't", "can't", "couldn't", "didn't", "doesn't", 
        "don't", "hasn't", "isn't", "mightn't", "mustn't", "shan't",                                  
         "shouldn't", "wasn't", "weren't", "won't", "wouldn't")
)

