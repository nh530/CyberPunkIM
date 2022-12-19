" Norman hong - 12/17/2022
" This adds the self keyword into the vim pythonBuiltin class. This way,
" the color that is assigned to pythonBuiltin will add the same color to self.
syn keyword pythonBuiltin self
syn keyword pythonBoolean True False None
" syn keyword pythonFunction 
"syn match pythonRun "()"
"syn match pythonRun "(\ze.*"
"syn match pythonRun ".*\zs)"
"syn match pythonRun "]\zs)"
syn match pythonFunctionParameterTyping "\(\a\+: \)\zs\(\a\|\.\)\+"
syn match pythonFunctionParameterTyping "\(\a\+: \)\zs\a\+\[.*]"
" A dot must be allowed because of @MYCLass.myfunc decorators.
syn match pythonDecoratorName "@\s*\h\%(\w\|\.\)*"
" very magic mode. :help \v for more info.
" () defines an atom which is a grouping of regex to create a pattern.
" (atom)@<= is a positive lookbehind for pattern denoted by (atom).
" (atom)@= is a postiive lookahead for pattern denoted by (atom).
syn match pythonFString "\v(\".{-})@<=(\{.{-}\})(.{-}\")@="
syn clear pythonString
syn cluster pyString contains=pythonEscape,@Spell,pythonFString
" redefining pythonString syntax group to include F Strings.
syn region pythonString matchgroup=pythonQuotes
      \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=@pyString
syn region pythonString matchgroup=pythonTripleQuotes
      \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend
      \ contains=pythonEscape,pythonSpaceError,pythonDoctest,@Spell
