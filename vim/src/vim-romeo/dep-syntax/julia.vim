echom "Warning: Deprecated syntax file loaded"
finish
if exists("b:current_syntax")
        finish
endif
" Variables


" Types
syn keyword juliaType Int UInt
syn keyword juliaType Int8 UInt8 Int16 UInt16 Int32 UInt32
syn keyword juliaType Int64 UInt64 Int128 UInt128 Bool
syn keyword juliaType Float16 Float32 Float64

" Builtin-Functions
syn keyword juliaBuiltin println
syn keyword juliaBuiltin div rem mod
syn keyword juliaBuiltin typeof typemin typemax
syn keyword juliaBuiltin bits
syn keyword juliaInternal WORD_SIZE

" Includes
syn keyword juliaInclude using

" Comment and Todos
syn keyword juliaTodo TODO FIXME contained
syn match juliaComment /#.*/ contains=juliaTodo
syn region juliaComment start=/#=/ end=/=#/ contains=juliaTodo

" Strings
syn region juliaString start=/"/ skip=/\\"/ end=/"/
" syn match juliaString /\s".*"\s/

highlight def link juliaInclude Include
highlight def link juliaBuiltin Function
highlight def link juliaComment Comment
highlight def link juliaString String
highlight def link juliaType Type
highlight def link juliaInternal Constant


let b:current_syntax = "julia"
