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


time_terms <- c("after", "all at once", "all of the time", "all the while", 
    "always", "as a final point", "as long as", "at present", "at the beginning", 
    "at the end", "at the same time", "at this point", "before", 
    "by now", "constant", "currently", "directly", "during", "earlier", 
    "eventually", "finally", "following", "formerly", "frequently", 
    "from now", "generally", "gradually", "henceforth", "henceforward", 
    "hitherto", "immediately", "in the end", "in the future", "in the meantime", 
    "infrequently", "initially", "instantly", "last", "later", "little by little", 
    "meantime", "meanwhile", "never", "not at all", "not long ago", 
    "now", "occasionally", "often", "periodically", "presently", 
    "previously", "prior to", "rarely", "recently", "repeatedly", 
    "same time", "seldom", "simultaneously", "some of the time", 
    "sometimes", "soon", "suddenly", "temporarily", "the following", 
    "then", "today", "tomorrow", "until", "up to now", "usually", 
    "when", "while", "without exception", "yesterday")

comp_regex <- c(
  "\\b[Aa]s\\b\\s+[a-z]+\\b\\s+as", 
  "\\b(([Mm]ore)|([Ll]ess))\\b\\s+[a-z]+\\b\\s+than", 
  "\\b[A-Za-z]??[a-z]*'*(s|(re)) like", 
  "\\b[Aa]s ((if)|(though))", 
  "\\b[Un]like", 
  "\\b[Ii]n\\s??(much)* the same way", 
  "\\b[Rr]esembling", 
  "\\b[Pp]arallel to", 
  "\\b[Ss]ame as", 
  "\\b(([Ee]qual)|([Ii]dentical)|([Ss]imilar))((ly)|( to))", 
  "\\b[Oo]f little difference", 
  "\\b[Mm]atching", 
  "\\balso", 
  "\\b[Ee]xactly", 
  "\\b[Ii]n relation to"
)


com_terms <- c("'s like", "also", "as if", "as though", "as xxx as", "equal to", 
    "equally", "exactly", "identical to", "identically", "in much the same way", 
    "in relation to", "in the same way", "is like", "less xxx than", 
    "matching", "more xxx than", "of little difference", "parallel to", 
    "re like", "resembling", "same as", "similar to", "similarly", 
    "unlike", "was like")

search_comp <- c(
    "(\\b[Aa]s\\b)(\\s+[a-z]+\\b\\s+)(as)", 
    "(\\b(([Mm]ore)|([Ll]ess))\\b)(\\s+[a-z]+\\b\\s+)(than)"
)

replace_comp <- c("\\1 xxx \\3", "\\1 xxx \\6")

