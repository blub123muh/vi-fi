if exists('b:current_syntax')
    finish
endif
syntax case match

syntax keyword juliaType Int8 Int16 Int32 Int64 Int128
syntax keyword juliaType UInt8 UInt16 UInt32 UInt64 UInt128
syntax keyword juliaType Float16 Float32 Float64
syntax keyword juliaType Number Real AbstractFloat Integer Signed Unsigned


syntax keyword juliaStatement if elseif else
highlight link juliaStatement Statement

syntax keyword juliaTodo TODO FIXME contained

syntax match juliaComment "\v#.*" contains=juliaTodo
syntax region juliaComment start=/\v#\=/ skip=/\v\\./ end=/\v\=#/ contains=juliaTodo
highlight link juliaComment Comment


syntax keyword juliaKeyword end
syntax keyword juliaKeyword function
syntax keyword juliaKeyword for in
syntax keyword juliaKeyword while
syntax keyword juliaKeyword return
syntax keyword juliaKeyword try catch

syntax keyword juliaKeyword begin

syntax keyword juliaKeyword type
syntax keyword juliaKeyword abstract
highlight link juliaKeyword Keyword

"{{{ Functions
syntax match juliaFunction '\v\w+\(.*\)' contained

" syntax keyword juliaFunction typeof
" syntax keyword juliaFunction subtypes
" syntax keyword juliaFunction issubtype
" syntax keyword juliaFunction println
" syntax keyword juliaFunction rand, randn
" syntax keyword juliaFunction eye linspace
" syntax keyword juliaFunction diagm
" syntax keyword juliaFunction div
" syntax keyword juliaFunction bits

" Accessing Files
" syntax keyword juliaFunction open
" syntax keyword juliaFunction close
" syntax keyword juliaFunction readall
highlight link juliaFunction Function
"}}}


" ASSIGNMENT
syntax match juliaOperator "\v\="

" INFIX OPERATORS
syntax match juliaOperator "\v\+"
syntax match juliaOperator "\v-"
syntax match juliaOperator "\v\*"
syntax match juliaOperator "\v/"
syntax match juliaOperator "\v\\"
syntax match juliaOperator "\v\^"
syntax match juliaOperator "\v\%"

" BITWISE OPERATORS
syntax match juliaOperator "\v\~"
syntax match juliaOperator "\v\&"
syntax match juliaOperator "\v\|"
syntax match juliaOperator "\v\$"
syntax match juliaOperator "\v\<\<"
syntax match juliaOperator "\v\>\>"
syntax match juliaOperator "\v\>\>\>"


" BOOLEAN OPERATORS
syntax match juliaOperator "\v!"
syntax match juliaOperator "\v\=\="
syntax match juliaOperator "\v!\="
syntax match juliaOperator "\v\<"
syntax match juliaOperator "\v\>"
syntax match juliaOperator "\v\<\="
syntax match juliaOperator "\v\>\="

" Dont forget Lambda Operator
syntax match juliaOperator "\v-\>"

highlight link juliaOperator Operator

" NUMBERS
syntax match juliaNumber "\v[0-9]+"
syntax match juliaNumber "\v[0-9]*\.[0-9]+"
syntax match juliaNumber "\vtrue"
syntax match juliaNumber "\vfalse"
highlight link juliaNumber Number

" Strings
syntax region juliaString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region juliaString start=/\v'/ skip=/\v\\./ end=/\v'/
highlight link juliaString String

syntax match juliaVariable "\v\a\w*"
highlight link juliaVariable Variable


let b:current_syntax = "julia"
