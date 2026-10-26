" Vim syntax file for the Bend language (bend / bend2)
" https://github.com/bendlang/bend
if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match   bendComment     "#.*$" contains=@Spell

" Strings and characters
syn match   bendString      /"\%([^"\\]\|\\.\)*"/
syn match   bendChar        /'\%([^'\\]\|\\.\)'/

" Numbers: U32 (42, 0xff), F32 (1.5, 2e10), Nat (3n)
syn match   bendNumber      /\<0x\x\+\>/
syn match   bendNumber      /\<\d\+n\>/
syn match   bendNumber      /\<\d\+\>/
syn match   bendFloat       /\<\d\+\.\d\+\([eE][-+]\?\d\+\)\?\>/

" Operators (single-char first, multi-char override by being defined later)
syn match   bendOperator    /[+*/%=<>!&|^-]/
syn match   bendOperator    /<&>\|->\|=>\|<-\|==\|!=\|++\|&&\|||\|<<\|>>/
syn match   bendOperator    /\.&\.\|\.|\.\|\.\^\|\//

" Keywords
syn keyword bendKeyword     import as type is def law for exs where
syn keyword bendKeyword     match case do return unsafe
syn keyword bendType        Type Data Kind Quant

" Names after def / type / law (lookbehind so the name is matched alone)
syn match   bendFunction    /\%(\<def\s\+\)\@<=[A-Za-z_][A-Za-z0-9_.]*/
syn match   bendType        /\%(\<\(type\|law\)\s\+\)\@<=[A-Za-z_][A-Za-z0-9_.]*/

" Constructors / datatype names (capitalised identifiers)
syn match   bendConstructor /\<[A-Z][A-Za-z0-9_]*\>/

" Delimiters
syn match   bendDelimiter   /[(){}\[\],;]/

" Special forms (defined last so they win over operators/delimiters)
syn match   bendQuantity    /&[012]\>/
syn match   bendReflexivity /{==}/
syn match   bendHole        /?\w\+/

hi def link bendComment      Comment
hi def link bendString       String
hi def link bendChar         Character
hi def link bendNumber       Number
hi def link bendFloat        Float
hi def link bendHole         Todo
hi def link bendQuantity     Special
hi def link bendReflexivity  Special
hi def link bendOperator     Operator
hi def link bendKeyword      Keyword
hi def link bendType         Type
hi def link bendFunction     Function
hi def link bendConstructor  Constant
hi def link bendDelimiter    Delimiter

let b:current_syntax = "bend"
