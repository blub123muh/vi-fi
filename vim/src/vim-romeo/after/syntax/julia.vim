" {{{ DataFrames
syn keyword juliaConstGeneric NA
syn keyword juliaTypeArray DataArray
syn keyword juliaTypeArray AbstractDataFrame DataFrame SubDataFrame
syn keyword juliaTypeArray Formula
syn keyword juliaTypeArray ModelFrame ModelMatrix
syn keyword juliaTypeArray PooledDataArray

" Make inline csv syntax more beautiful?
" extend to wsv tsv etc
syn match juliaStatsCSVDelim contained /,/
syn region  juliaStatsCSVString		matchgroup=juliaStringDelim start=+\<csv"""+ skip=+\%(\\\\\)*\\"+ end=+"""+ contains=@juliaSpecialChars,juliaNumber,juliaFloat,juliaStatsCSVDelim
syn match juliaStatsCSV2Delim contained /;/
syn region  juliaStatsCSV2String		matchgroup=juliaStringDelim start=+\<csv2"""+ skip=+\%(\\\\\)*\\"+ end=+"""+ contains=@juliaSpecialChars,juliaNumber,juliaFloat,juliaStatsCSV2Delim
syn match juliaStatsWSVDelim contained /\s/
syn region  juliaStatsWSVString		matchgroup=juliaStringDelim start=+\<wsv"""+ skip=+\%(\\\\\)*\\"+ end=+"""+ contains=@juliaSpecialChars,juliaNumber,juliaFloat,juliaStatsWSVDelim
syn match juliaStatsTSVDelim contained /\t/
syn region  juliaStatsTSVString		matchgroup=juliaStringDelim start=+\<tsv"""+ skip=+\%(\\\\\)*\\"+ end=+"""+ contains=@juliaSpecialChars,juliaNumber,juliaFloat,juliaStatsTSVDelim
" New Groups (mainly for functions)
syn keyword juliaStatsFunction describe dump
syn keyword juliaStatsFunction hcat vcat
syn keyword juliaStatsFunction names rename eltypes length
syn keyword juliaStatsFunction size head tail
syn keyword juliaStatsFunction dropna convert
syn keyword juliaStatsFunction mean median
syn keyword juliaStatsFunction colwise
syn keyword juliaStatsFunction complete_cases
syn keyword juliaStatsFunction nonunique unique similar
syn keyword juliaStatsFunction readtable writetable
syn keyword juliaStatsFunction join
syn keyword juliaStatsFunction by aggregate groupby
syn keyword juliaStatsFunction stack melt unstack
syn keyword juliaStatsFunction stackdf meltdf
syn keyword juliaStatsFunction sort
syn keyword juliaStatsFunction levels compact pool

" Linking...
hi def link juliaStatsFunction Function

hi def link juliaStatsCSVString String
hi def link juliaStatsCSV2String String
hi def link juliaStatsWSVString String
hi def link juliaStatsTSVString String

hi def link juliaStatsCSVDelim Special
hi def link juliaStatsCSV2Delim Special
hi def link juliaStatsWSVDelim Special
hi def link juliaStatsTSVDelim Special
" }}}
