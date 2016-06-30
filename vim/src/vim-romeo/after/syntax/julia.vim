" {{{1 Julia Builtin Functions
" I like to have them highlighted
syn keyword juliaBuiltin print println
syn keyword juliaBuiltin unique
syn keyword juliaBuiltin dump
syn keyword juliaBuiltin length size
syn keyword juliaBuiltin eltype
" }}}1
" {{{1 DataFrames
syn keyword juliaConstGeneric NA
syn keyword juliaDataFramesTypes DataArray
syn keyword juliaDataFramesTypes AbstractDataFrame DataFrame SubDataFrame
syn keyword juliaDataFramesTypes Formula
syn keyword juliaDataFramesTypes ModelFrame ModelMatrix
syn keyword juliaDataFramesTypes PooledDataArray

" Make inline csv syntax more beautiful?
syn match juliaDataFramesInlineCSVSep contained /,/
syn region  juliaDataFramesInlineCSV		matchgroup=juliaDataFramesInlineDelim start=+\<csv"""+ skip=+\%(\\\\\)*\\"+ end=+"""+ contains=@juliaSpecialChars,juliaNumber,juliaFloat,juliaDataFramesInlineCSVSep
syn match juliaDataFramesInlineCSV2Sep contained /;/
syn region  juliaDataFramesInlineCSV2		matchgroup=juliaDataFramesInlineDelim start=+\<csv2"""+ skip=+\%(\\\\\)*\\"+ end=+"""+ contains=@juliaSpecialChars,juliaNumber,juliaFloat,juliaDataFramesInlineCSV2Sep
syn match juliaDataFramesInlineWSVSep contained /\s/
syn region  juliaDataFramesInlineWSV		matchgroup=juliaDataFramesInlineDelim start=+\<wsv"""+ skip=+\%(\\\\\)*\\"+ end=+"""+ contains=@juliaSpecialChars,juliaNumber,juliaFloat,juliaDataFramesInlineWSVSep
syn match juliaDataFramesInlineTSVSep contained /\t/
syn region  juliaDataFramesInlineTSV		matchgroup=juliaDataFramesInlineDelim start=+\<tsv"""+ skip=+\%(\\\\\)*\\"+ end=+"""+ contains=@juliaSpecialChars,juliaNumber,juliaFloat,juliaDataFramesInlineTSVSep

" New Groups (mainly for functions)
syn keyword juliaDataFramesBuiltin hcat vcat
syn keyword juliaDataFramesBuiltin names rename eltypes
syn keyword juliaDataFramesBuiltin head tail
syn keyword juliaDataFramesBuiltin dropna convert
syn keyword juliaDataFramesBuiltin mean median
syn keyword juliaDataFramesBuiltin colwise
syn keyword juliaDataFramesBuiltin complete_cases
syn keyword juliaDataFramesBuiltin nonunique unique similar
syn keyword juliaDataFramesBuiltin readtable writetable
syn keyword juliaDataFramesBuiltin join
syn keyword juliaDataFramesBuiltin by aggregate groupby
syn keyword juliaDataFramesBuiltin stack melt unstack
syn keyword juliaDataFramesBuiltin stackdf meltdf
syn keyword juliaDataFramesBuiltin sort
syn keyword juliaDataFramesBuiltin levels compact pool

" better regex?
syn match juliaDataFramesColIdentifier +:\<\D\w*\>+
"}}}
" StatsBase {{{1
syn keyword juliaStatsBaseTypes WeightVec
syn keyword juliaStatsBaseBuiltin eltype isempty values sum
" Mean Functions {{{2
syn keyword juliaStatsBaseBuiltin geomean harmmean trimmean mean
" }}}
" Scalar Statistics {{{2
syn keyword juliaStatsBaseBuiltin var std mean_and_var mean_and_std
                        \ skewness kurtosis moment
syn keyword juliaStatsBaseBuiltin span variation sem mad
" Z-scores
syn keyword juliaStatsBaseBuiltin zscore
" Entropy and Friends
syn keyword juliaStatsBaseBuiltin entropy crossentropy kldivergence
" Quantile and Friends
syn keyword juliaStatsBaseBuiltin percentile iqr nquantile quantile median 
" Mode and Modes
syn keyword juliaStatsBaseBuiltin mode modes
" Summary of Statistics
syn keyword juliaStatsBaseBuiltin summarystats describe
" }}}
" Computing Deviations {{{
syn keyword juliaStatsBaseBuiltin counteq countne sqL2dist L2dist L1dist
                        \ Linfdist gkldiv meanad maxad msd rmsd psnr
" }}}
" Scatter Matrix and Covariance {{{
syn keyword juliaStatsBaseBuiltin scattermat scatter cov mean_and_cov
" }}}
" Counting Functions {{{
" Counting over an Integer Range
syn keyword juliaStatsBaseBuiltin counts proportions addcounts
" Counting over arbitrary distinct values
syn keyword juliaStatsBaseBuiltin countmap porportionmap 
" }}}
" Rankings {{{
syn keyword juliaStatsBaseBuiltin ordinalrank competerank denserank tiedrank
" }}}
" Sampling from Population {{{
" Sampling Api
syn keyword juliaStatsBaseBuiltin sample direct_sample xmultinom_sample
                        \ samplepair knuths_sample fisher_yates_sample
                        \ self_avoid_sample seqsample_a seqsample_c
                        \ direct_sample alias_sample naive_wsample_norep
" }}}
" Empirical Estimation {{{
" Histogram
syn keyword juliaStatsBaseTypes Histogram
syn keyword juliaStatsBaseBuiltin fit
" Empirical Cumulative Distribution Function
syn keyword juliaStatsBaseBuiltin ecdf
" }}}2
" Correlation Analysis of Signals {{{
" Autocovariance and Autocorrelation
syn keyword juliaStatsBaseBuiltin autocov autocor
" Cross-covariance and Cross-correlation
syn keyword juliaStatsBaseBuiltin crosscov crosscor
" Partial Autocorrelation Function
syn keyword juliaStatsBaseBuiltin pacf corspearman corkendall
" }}}2
" Miscellaneous Functions {{{
syn keyword juliaStatsBaseBuiltin rle inverse_rle
syn keyword juliaStatsBaseBuiltin levelsmap indexmap
syn keyword juliaStatsBaseBuiltin findat
syn keyword juliaStatsBaseBuiltin indicatormat
" }}}2
" Abstraction for Statistical Models {{{
syn keyword juliaStatsBaseBuiltin coef coeftable coefint
syn keyword juliaStatsBaseBuiltin deviance
syn keyword juliaStatsBaseBuiltin loglikelihood
syn keyword juliaStatsBaseBuiltin stderr
syn keyword juliaStatsBaseBuiltin vcov
syn keyword juliaStatsBaseBuiltin nobs model_response predict residuals
" }}}2
" }}}1
" HypothesisTests {{{
" Methods {{{
syn keyword juliaHypothesisTestsBuiltin ci
syn keyword juliaHypothesisTestsBuiltin pvalue
" }}}
" Parametric Tests {{{
syn keyword juliaHypothesisTestsBuiltin BTest
syn keyword juliaHypothesisTestsBuiltin OneSampleTTest EqualVarianceTTest UnequalVarianceTTest
syn keyword juliaHypothesisTestsBuiltin PowerDivergenceTest ChisqTest MultinomialLRT
" }}}
" Nonparametric Tests {{{
syn keyword juliaHypothesisTestsBuiltin BinomialTest
syn keyword juliaHypothesisTestsBuiltin FisherExactTest
syn keyword juliaHypothesisTestsBuiltin ExactOneSampleKSTest
                        \ ApproximateOneSampleKSTest
                        \ ApproximateTwoSampleKSTest
syn keyword juliaHypothesisTestsBuiltin KruskalWallisTest
syn keyword juliaHypothesisTestsBuiltin MannWhitneyUTest
                        \ ExactMannWhitneyUTest
                        \ ApproximateMannWhitneyUTest
syn keyword juliaHypothesisTestsBuiltin SignTest
syn keyword juliaHypothesisTestsBuiltin SignedRankTest
                        \ ExactSignedRankTest
                        \ ApproximateSignedRankTest
syn keyword juliaHypothesisTestsBuiltin OneSampleADTest KSampleADTest
" }}}
" }}}
" {{{1 Distributions
" {{{2 Type Hierarchy
syn keyword juliaDistributionsTypes Sampleable
syn keyword juliaDistributionsTypes Distribution
syn keyword juliaDistributionsTypes Univariate Multivariate Matrixvariate
syn keyword juliaDistributionsTypes Discrete Continuous
syn keyword juliaDistributionsTypes UnivariateDistribution MultivariateDistribution MatrixvariateDistribution NonMatrixDistribution
syn keyword juliaDistributionsTypes DiscreteDistribution ContinuousDistribution
syn keyword juliaDistributionsTypes DiscreteUnivariateDistribution DiscreteMultivariateDistribution DiscreteMatrixvariateDistribution
syn keyword juliaDistributionsTypes ContinuousUnivariateDistribution ContinuousMultivariateDistribution ContinuousMatrixvariateDistribution
syn keyword juliaDistributionsBuiltin nsamples
syn keyword juliaDistributionsBuiltin rand
syn keyword juliaDistributionsBuiltin srand
syn keyword juliaDistributionsBuiltin Normal
syn keyword juliaDistributionsBuiltin quantile
" }}}2
" {{{2 Univariate Distributions
syn keyword juliaDistributionsBuiltin params
syn keyword juliaDistributionsBuiltin succprob failprob
syn keyword juliaDistributionsBuiltin scale location
syn keyword juliaDistributionsBuiltin shape rate ncategories ntrials dof

syn   keyword          juliaDistributionsBuiltin   var                std             median          modes   mode   skewness
syn   keyword          juliaDistributionsBuiltin   kurtosis           isplatykurtic   isleptokurtic
"     }}}
"     }}}1
"Linking...{{{1

syn cluster juliaKeywordItems add=juliaBuiltin

hi def link juliaBuiltin Function


syn   cluster   juliaTypesItems     add=juliaDataFramesTypes
syn   cluster   juliaKeywordItems   add=juliaDataFramesBuiltin
syn   cluster   juliaExpressions    add=juliaDataFramesColIdentifier

hi def link juliaDataFramesInlineDelim     String
hi def link juliaDataFramesInlineCSV       Constant
hi def link juliaDataFramesInlineCSV2      Constant
hi def link juliaDataFramesInlineWSV       Constant
hi def link juliaDataFramesInlineTSV       Constant
hi def link juliaDataFramesInlineCSVSep    Special
hi def link juliaDataFramesInlineCSV2Sep   Special
hi def link juliaDataFramesInlineWSVSep    Special
hi def link juliaDataFramesInlineWSV2Sep   Special

hi   def   link   juliaDataFramesTypes           Type
hi   def   link   juliaDataFramesBuiltin         Function
hi   def   link   juliaDataFramesColIdentifier   Special


syn   cluster   juliaTypesItems     add=juliaStatsBaseTypes
syn   cluster   juliaKeywordItems   add=juliaStatsBaseBuiltin
hi    def       link                juliaStatsBaseTypes         Type
hi    def       link                juliaStatsBaseBuiltin       Function


syn   cluster   juliaKeywordItems   add=juliaHypothesisTestsBuiltin
hi    def       link                juliaHypothesisTestsBuiltin       Function


syn   cluster   juliaTypesItems     add=juliaDistributionsTypes
syn   cluster   juliaKeywordItems   add=juliaDistributionsBuiltin
hi    def       link                juliaDistributionsTypes         Type
hi    def       link                juliaDistributionsBuiltin       Function

" }}}1
