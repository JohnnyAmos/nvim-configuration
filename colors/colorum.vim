" Colorum for nvim
" Johnny L. Amos Jr.
" License: MIT
" Last modified: 2024-12-05 22:11

" Based on: tinted-vim (https://github.com/tinted-theming/tinted-vim)
" Scheme name: Colors
" Scheme author: mrmrs (http://clrs.cc)
" Template author: Tinted Theming (https://github.com/tinted-theming)

" Terminal color definitions
let s:cterm00        = "00"
let g:base16_cterm00 = "00"
let s:cterm03        = "08"
let g:base16_cterm03 = "08"
let s:cterm05        = "07"
let g:base16_cterm05 = "07"
let s:cterm07        = "15"
let g:base16_cterm07 = "15"
let s:cterm08        = "01"
let g:base16_cterm08 = "01"
let s:cterm0A        = "03"
let g:base16_cterm0A = "03"
let s:cterm0B        = "02"
let g:base16_cterm0B = "02"
let s:cterm0C        = "06"
let g:base16_cterm0C = "06"
let s:cterm0D        = "04"
let g:base16_cterm0D = "04"
let s:cterm0E        = "05"
let g:base16_cterm0E = "05"

if (exists("base16_colorspace") && base16_colorspace == "256")
   let s:cterm01        = "18"
   let g:base16_cterm01 = "18"
   let s:cterm02        = "19"
   let g:base16_cterm02 = "19"
   let s:cterm04        = "20"
   let g:base16_cterm04 = "20"
   let s:cterm06        = "21"
   let g:base16_cterm06 = "21"
   let s:cterm09        = "16"
   let g:base16_cterm09 = "16"
   let s:cterm0F        = "17"
   let g:base16_cterm0F = "17"
else
   let s:cterm01        = "10"
   let g:base16_cterm01 = "10"
   let s:cterm02        = "11"
   let g:base16_cterm02 = "11"
   let s:cterm04        = "12"
   let g:base16_cterm04 = "12"
   let s:cterm06        = "13"
   let g:base16_cterm06 = "13"
   let s:cterm09        = "09"
   let g:base16_cterm09 = "09"
   let s:cterm0F        = "14"
   let g:base16_cterm0F = "14"
endif

" Neovim terminal colours
if has("nvim")
   let g:terminal_color_0 =  "#111111"
   let g:terminal_color_1 =  "#ff4136"
   let g:terminal_color_2 =  "#2ecc40"
   let g:terminal_color_3 =  "#ffdc00"
   let g:terminal_color_4 =  "#0074d9"
   let g:terminal_color_5 =  "#b10dc9"
   let g:terminal_color_6 =  "#7fdbff"
   let g:terminal_color_7 =  "#bbbbbb"
   let g:terminal_color_8 =  "#777777"
   let g:terminal_color_9 =  "#ff4136"
   let g:terminal_color_10 = "#2ecc40"
   let g:terminal_color_11 = "#ffdc00"
   let g:terminal_color_12 = "#0074d9"
   let g:terminal_color_13 = "#b10dc9"
   let g:terminal_color_14 = "#7fdbff"
   let g:terminal_color_15 = "#ffffff"
   let g:terminal_color_background = g:terminal_color_0
   let g:terminal_color_foreground = g:terminal_color_5
   if &background == "light"
      let g:terminal_color_background = g:terminal_color_7
      let g:terminal_color_foreground = g:terminal_color_2
   endif
elseif has("terminal")
   let g:terminal_ansi_colors = [
         \ "#111111",
         \ "#ff4136",
         \ "#2ecc40",
         \ "#ffdc00",
         \ "#0074d9",
         \ "#b10dc9",
         \ "#7fdbff",
         \ "#bbbbbb",
         \ "#777777",
         \ "#ff4136",
         \ "#2ecc40",
         \ "#ffdc00",
         \ "#0074d9",
         \ "#b10dc9",
         \ "#7fdbff",
         \ "#ffffff",
         \ ]
endif
let s:ctermbg = s:cterm00

" Theme setup
hi clear
syntax reset
let g:colors_name = "colorum"

" Highlighting function
" Optional variables are attributes and guisp
function! g:Base16hi(group, ctermfg, ctermbg, ...)
   let l:attr = get(a:, 1, "")

   if a:ctermfg != ""
      exec "hi " . a:group . " ctermfg=" . a:ctermfg
   endif
   if a:ctermbg != ""
      exec "hi " . a:group . " ctermbg=" . a:ctermbg
   endif
   if l:attr != ""
      exec "hi " . a:group . " cterm=" . l:attr
   endif
endfunction


fun <sid>hi(group, ctermfg, ctermbg, attr)
   call g:Base16hi(a:group, a:ctermfg, a:ctermbg, a:attr)
endfun

" Vim editor colors
call <sid>hi("Normal", s:cterm05, s:ctermbg, "")
call <sid>hi("Bold", "", "", "bold")
call <sid>hi("Debug", s:cterm08, "", "")
call <sid>hi("Directory", s:cterm0D, "", "")
call <sid>hi("Error", s:ctermbg, s:cterm08, "")
call <sid>hi("ErrorMsg", s:cterm08, s:ctermbg, "")
call <sid>hi("Exception", s:cterm08, "", "")
call <sid>hi("FoldColumn", s:cterm03, s:ctermbg, "")
call <sid>hi("Folded", s:cterm02, s:ctermbg, "")
call <sid>hi("IncSearch", s:cterm01, s:cterm09, "none")
call <sid>hi("Italic", "", "", "italic")
call <sid>hi("Macro", s:cterm0C, "", "")
call <sid>hi("MatchParen", "", s:cterm03,  "")
call <sid>hi("ModeMsg", s:cterm0B, "", "")
call <sid>hi("MoreMsg", s:cterm0B, "", "")
call <sid>hi("Question", s:cterm0D, "", "")
call <sid>hi("Search", s:cterm01, s:cterm0A,  "")
call <sid>hi("Substitute", s:cterm01, s:cterm0A, "none")
call <sid>hi("SpecialKey", s:cterm03, "", "")
call <sid>hi("TooLong", s:cterm08, "", "")
call <sid>hi("Underlined", "", "", "underline")
call <sid>hi("Visual", "", s:cterm02, "")
call <sid>hi("VisualNOS", s:cterm08, "", "")
call <sid>hi("WarningMsg", s:cterm08, "", "")
call <sid>hi("WildMenu", s:ctermbg, s:cterm05, "")
call <sid>hi("Title", s:cterm0D, "", "none")
call <sid>hi("Conceal", s:cterm0D, s:ctermbg, "")
call <sid>hi("Cursor", "", "", "inverse")
call <sid>hi("NonText", s:cterm03, "", "")
call <sid>hi("Whitespace", s:cterm03, "", "")
call <sid>hi("LineNr", s:cterm03, s:ctermbg, "")
call <sid>hi("SignColumn", s:cterm03, s:ctermbg, "")
call <sid>hi("StatusLine", s:cterm04, s:cterm01, "none")
call <sid>hi("StatusLineNC", s:cterm03, s:cterm01, "none")
call <sid>hi("VertSplit", s:cterm01, s:ctermbg, "none")
call <sid>hi("ColorColumn", "", s:cterm01, "none")
call <sid>hi("CursorColumn", "", s:cterm01, "none")
call <sid>hi("CursorLine", "", s:cterm01, "none")
call <sid>hi("CursorLineNr", s:cterm04, s:cterm01, "bold")
call <sid>hi("QuickFixLine", "", s:cterm01, "none")
call <sid>hi("PMenu", s:cterm06, s:cterm01, "none")
call <sid>hi("PMenuSel", s:cterm06, s:cterm02, "")
call <sid>hi("PMenuSbar", "", s:cterm03, "")
call <sid>hi("PMenuThumb", "", s:cterm04, "")
call <sid>hi("TabLine", s:cterm03, s:cterm01, "none")
call <sid>hi("TabLineFill", s:cterm03, s:cterm01, "none")
call <sid>hi("TabLineSel", s:cterm0B, s:cterm01, "none")

" Standard syntax
call <sid>hi("Boolean", s:cterm09, "", "")
call <sid>hi("Character", s:cterm08, "", "")
call <sid>hi("Comment", s:cterm03, "", "")
call <sid>hi("Conditional", s:cterm0E, "", "")
call <sid>hi("Constant", s:cterm09, "", "")
call <sid>hi("Define", s:cterm0E, "", "none")
call <sid>hi("Delimiter", s:cterm05, "", "")
if has("patch-8.0.1038")
   call <sid>hi("Deprecated", "", "", "strikethrough")
endif
call <sid>hi("Float", s:cterm09, "", "")
call <sid>hi("Function", s:cterm0D, "", "")
call <sid>hi("Identifier", s:cterm05, "", "none")
call <sid>hi("Include", s:cterm0D, "", "")
call <sid>hi("Keyword", s:cterm0E, "", "none")
call <sid>hi("Label", s:cterm0A, "", "")
call <sid>hi("Number", s:cterm09, "", "")
call <sid>hi("Operator", s:cterm0C, "", "none")
call <sid>hi("PreProc", s:cterm0A, "", "")
call <sid>hi("Repeat", s:cterm0E, "", "")
call <sid>hi("Special", s:cterm0C, "", "")
call <sid>hi("SpecialChar", s:cterm0F, "", "")
call <sid>hi("Statement", s:cterm08, "", "")
call <sid>hi("StorageClass", s:cterm0A, "", "")
call <sid>hi("String", s:cterm0B, "", "")
call <sid>hi("Structure", s:cterm0A, "", "")
call <sid>hi("Tag", s:cterm0A, "", "")
call <sid>hi("Todo", s:cterm08, s:ctermbg, "")
call <sid>hi("Type", s:cterm0A, "", "none")
call <sid>hi("Typedef", s:cterm0A, "", "")

" Treesitter
if has("nvim-0.8.0")
   call <sid>hi("@field", s:cterm08, "", "")
   call <sid>hi("@property", s:cterm08, "", "")
   call <sid>hi("@namespace", s:cterm05, "", "italic")
   call <sid>hi("@variable", s:cterm05, "", "")
   call <sid>hi("@variable.builtin", s:cterm05, "", "italic")
   call <sid>hi("@text.reference", s:cterm08, "", "")
   call <sid>hi("@text.uri", s:cterm08, "", "italic")

   " Annotations & Attributes
   call <sid>hi("@annotation", s:cterm0E, "", "")
   call <sid>hi("@attribute", s:cterm0D, "", "")

   " Booleans, Characters & Comments
   call <sid>hi("@boolean", s:cterm09, "", "")
   call <sid>hi("@character", s:cterm08, "", "")
   call <sid>hi("@character.special", s:cterm0F, "", "")
   call <sid>hi("@comment", s:cterm03, "", "")

   " Conditionals, Constants & Debugging
   call <sid>hi("@keyword.conditional", s:cterm0E, "", "")
   call <sid>hi("@constant", s:cterm09, "", "")
   call <sid>hi("@constant.builtin", s:cterm09, "", "")
   call <sid>hi("@constant.macro", s:cterm08, "", "")
   call <sid>hi("@keyword.debug", s:cterm08, "", "")

   " Directives & Exceptions
   call <sid>hi("@keyword.directive.define", s:cterm0E, "", "")
   call <sid>hi("@keyword.exception", s:cterm0E, "", "")

   " Floats & Functions
   call <sid>hi("@number.float", s:cterm09, "", "")
   call <sid>hi("@function", s:cterm0D, "", "")
   call <sid>hi("@function.builtin", s:cterm0D, "", "")
   call <sid>hi("@function.call", s:cterm0D, "", "")
   call <sid>hi("@function.macro", s:cterm08, "", "")

   " Imports, Operators & Returns
   call <sid>hi("@keyword.import", s:cterm0E, "", "")
   call <sid>hi("@keyword.coroutine", s:cterm0E, "", "")
   call <sid>hi("@keyword.operator", s:cterm05, "", "")
   call <sid>hi("@keyword.return", s:cterm0E, "", "")

   " Methods & Namespaces
   call <sid>hi("@function.method", s:cterm0D, "", "")
   call <sid>hi("@function.method.call", s:cterm0D, "", "")
   call <sid>hi("@namespace.builtin", s:cterm0E, "", "")

   " Numbers & Directives
   call <sid>hi("@none", s:cterm05, "", "")
   call <sid>hi("@number", s:cterm09, "", "")
   call <sid>hi("@keyword.directive", s:cterm0E, "", "")

   " Repeats, Storage & Strings
   call <sid>hi("@keyword.repeat", s:cterm0E, "", "")
   call <sid>hi("@keyword.storage", s:cterm0E, "", "")
   call <sid>hi("@string", s:cterm0B, "", "")

   " Tags & Markup
   call <sid>hi("@markup.link.label", s:cterm0A, "", "")
   call <sid>hi("@markup.link.label.symbol", s:cterm0A, "", "")
   call <sid>hi("@tag", s:cterm08, "", "")
   call <sid>hi("@tag.attribute", s:cterm0A, "", "")
   call <sid>hi("@tag.delimiter", s:cterm0F, "", "")

   " More Markup
   call <sid>hi("@markup", s:cterm0A, "", "")
   call <sid>hi("@markup.environment", s:cterm0A, "", "")
   call <sid>hi("@markup.environment.name", s:cterm0A, "", "")
   call <sid>hi("@markup.raw", s:cterm09, "", "")
   call <sid>hi("@markup.math", s:cterm0A, "", "")
   call <sid>hi("@markup.strong", s:cterm0A, "", "")
   call <sid>hi("@markup.emphasis", s:cterm0A, "", "")
   call <sid>hi("@markup.strikethrough", s:cterm0A, "", "")
   call <sid>hi("@markup.underline", s:cterm0A, "", "")
   call <sid>hi("@markup.heading", s:cterm0D, "", "")

   " Comments & Types
   call <sid>hi("@comment.note", s:cterm03, "", "")
   call <sid>hi("@comment.error", s:cterm08, "", "")
   call <sid>hi("@comment.hint", s:cterm0B, "", "")
   call <sid>hi("@comment.info", s:cterm0D, "", "")
   call <sid>hi("@comment.warning", s:cterm09, "", "")
   call <sid>hi("@comment.todo", s:cterm0A, "", "")
   call <sid>hi("@markup.link.url", s:cterm09, "", "")
   call <sid>hi("@type", s:cterm0A, "", "")
   call <sid>hi("@type.definition", s:cterm0E, "", "")
   call <sid>hi("@type.qualifier", s:cterm0E, "", "")

   " Nvim 0.10 migration
   if has("nvim-0.10.0")
      hi! link @parameter             @variable.parameter
      hi! link @float                 @number.float
      hi! link @symbol                @string.special.symbol
      hi! link @string.regex          @string.regexp
      hi! link @text.strong           @markup.strong
      hi! link @text.emphasis         @markup.italic
      hi! link @text.underline        @markup.underline
      hi! link @text.strike           @markup.strikethrough
      hi! link @text.title            @markup.heading
      hi! link @text.quote            @markup.quote
      hi! link @text.uri              @markup.link.url
      hi! link @text.math             @markup.math
      hi! link @text.environment      @markup.environment
      hi! link @text.environment.name @markup.environment.name
      hi! link @text.reference        @markup.link
      hi! link @text.literal          @markup.raw
      hi! link @text.literal.block    @markup.raw.block
      hi! link @string.special        @markup.link.label
      hi! link @punctuation.special   @markup.list

      hi! link @method                @function.method
      hi! link @method.call           @function.method.call
      hi! link @text.todo             @comment.todo
      hi! link @text.danger           @comment.error
      hi! link @text.warning          @comment.warning
      hi! link @text.note             @comment.hint
      hi! link @text.note             @comment.info
      hi! link @text.note             @comment.note
      hi! link @text.note             @comment.ok
      hi! link @text.diff.add         @diff.plus
      hi! link @text.diff.delete      @diff.minus
      hi! link @text.diff.change      @diff.delta
      hi! link @text.uri              @string.special.url
      hi! link @preproc               @keyword.directive
      hi! link @storageclass          @keyword.storage
      hi! link @define                @keyword.directive
      hi! link @conditional           @keyword.conditional
      hi! link @debug                 @keyword.debug
      hi! link @exception             @keyword.exception
      hi! link @include               @keyword.import
      hi! link @repeat                @keyword.repeat
   endif
endif

" Standard highlights to be used by plugins
if has("patch-8.0.1038")
   call <sid>hi("Deprecated", "", "", "strikethrough")
endif
call <sid>hi("SearchMatch", s:cterm0C, "", "")

call <sid>hi("GitAddSign", s:cterm0B, "", "")
call <sid>hi("GitChangeSign", s:cterm04, "", "")
call <sid>hi("GitDeleteSign", s:cterm08, "", "")
call <sid>hi("GitChangeDeleteSign", s:cterm04, "", "")

call <sid>hi("ErrorSign", s:cterm08, "", "")
call <sid>hi("WarningSign", s:cterm09, "", "")
call <sid>hi("InfoSign", s:cterm0D, "", "")
call <sid>hi("HintSign", s:cterm0C, "", "")
call <sid>hi("OkSign", s:cterm0B, "", "")

call <sid>hi("ErrorFloat", s:cterm08, s:cterm01, "")
call <sid>hi("WarningFloat", s:cterm09, s:cterm01, "")
call <sid>hi("InfoFloat", s:cterm0D, s:cterm01, "")
call <sid>hi("HintFloat", s:cterm0C, s:cterm01, "")
call <sid>hi("OkFloat", s:cterm0B, s:cterm01, "")

call <sid>hi("ErrorHighlight", s:ctermbg, s:cterm08, "underline")
call <sid>hi("WarningHighlight", s:ctermbg, s:cterm09, "underline")
call <sid>hi("InfoHighlight", s:ctermbg, s:cterm0D, "underline")
call <sid>hi("HintHighlight", s:ctermbg, s:cterm0C, "underline")
call <sid>hi("OkHighlight", s:ctermbg, s:cterm0B, "underline")

call <sid>hi("SpellBad", s:ctermbg, s:cterm08, "undercurl")
call <sid>hi("SpellLocal", s:ctermbg, s:cterm0C, "undercurl")
call <sid>hi("SpellCap", s:ctermbg, s:cterm0D, "undercurl")
call <sid>hi("SpellRare", s:ctermbg, s:cterm0E, "undercurl")

call <sid>hi("ReferenceText", s:cterm01, s:cterm0A, "")
call <sid>hi("ReferenceRead", s:cterm01, s:cterm0B, "")
call <sid>hi("ReferenceWrite", s:cterm01, s:cterm08, "")

" C
call <sid>hi("cOperator", s:cterm0C, "", "")
call <sid>hi("cPreCondit", s:cterm0E, "", "")

" C#
call <sid>hi("csClass", s:cterm0A, "", "")
call <sid>hi("csAttribute", s:cterm0A, "", "")
call <sid>hi("csModifier", s:cterm0E, "", "")
call <sid>hi("csType", s:cterm08, "", "")
call <sid>hi("csUnspecifiedStatement", s:cterm0D, "", "")
call <sid>hi("csContextualStatement", s:cterm0E, "", "")
call <sid>hi("csNewDecleration", s:cterm08, "", "")

" Clap
hi! link ClapInput             ColorColumn
hi! link ClapSpinner           ColorColumn
hi! link ClapDisplay           Default
hi! link ClapPreview           ColorColumn
hi! link ClapCurrentSelection  CursorLine
hi! link ClapNoMatchesFound    ErrorFloat

" Coc
hi! link CocErrorSign         ErrorSign
hi! link CocWarningSign       WarningSign
hi! link CocInfoSign          InfoSign
hi! link CocHintSign          HintSign

hi! link CocErrorFloat        ErrorFloat
hi! link CocWarningFloat      WarningFloat
hi! link CocInfoFloat         InfoFloat
hi! link CocHintFloat         HintFloat

hi! link CocErrorHighlight    ErrorHighlight
hi! link CocWarningHighlight  WarningHighlight
hi! link CocInfoHighlight     InfoHighlight
hi! link CocHintHighlight     HintHighlight

hi! link CocSem_angle             Keyword
hi! link CocSem_annotation        Keyword
hi! link CocSem_attribute         Type
hi! link CocSem_bitwise           Keyword
hi! link CocSem_boolean           Boolean
hi! link CocSem_brace             Normal
hi! link CocSem_bracket           Normal
hi! link CocSem_builtinAttribute  Type
hi! link CocSem_builtinType       Type
hi! link CocSem_character         String
hi! link CocSem_class             Structure
hi! link CocSem_colon             Normal
hi! link CocSem_comma             Normal
hi! link CocSem_comment           Comment
hi! link CocSem_comparison        Keyword
hi! link CocSem_concept           Keyword
hi! link CocSem_constParameter    Identifier
hi! link CocSem_dependent         Keyword
hi! link CocSem_dot               Keyword
hi! link CocSem_enum              Structure
hi! link CocSem_enumMember        Constant
hi! link CocSem_escapeSequence    Type
hi! link CocSem_event             Identifier
hi! link CocSem_formatSpecifier   Type
hi! link CocSem_function          Function
hi! link CocSem_interface         Type
hi! link CocSem_keyword           Keyword
hi! link CocSem_label             Keyword
hi! link CocSem_logical           Keyword
hi! link CocSem_macro             Macro
hi! link CocSem_method            Function
hi! link CocSem_modifier          Keyword
hi! link CocSem_namespace         Identifier
hi! link CocSem_number            Number
hi! link CocSem_operator          Operator
hi! link CocSem_parameter         Identifier
hi! link CocSem_parenthesis       Normal
hi! link CocSem_property          Identifier
hi! link CocSem_punctuation       Keyword
hi! link CocSem_regexp            Type
hi! link CocSem_selfKeyword       Constant
hi! link CocSem_semicolon         Normal
hi! link CocSem_string            String
hi! link CocSem_struct            Structure
hi! link CocSem_type              Type
hi! link CocSem_typeAlias         Type
hi! link CocSem_typeParameter     Type
hi! link CocSem_unknown           Normal
hi! link CocSem_variable          Identifier

call <sid>hi("CocHighlightRead",  s:cterm0B, s:cterm01, "")
call <sid>hi("CocHighlightText",  s:cterm0A, s:cterm01, "")
call <sid>hi("CocHighlightWrite",  s:cterm08, s:cterm01, "")
call <sid>hi("CocListMode",  s:cterm01, s:cterm0B, "bold")
call <sid>hi("CocListPath",  s:cterm01, s:cterm0B, "")
call <sid>hi("CocSessionsName", s:cterm05, "", "")

" CSS
call <sid>hi("cssBraces", s:cterm05, "", "")
call <sid>hi("cssClassName", s:cterm0E, "", "")
call <sid>hi("cssColor", s:cterm0C, "", "")

" CMP
hi! link CmpItemAbbrDeprecated  Deprecated
hi! link CmpItemAbbrMatch       SearchMatch
hi! link CmpItemAbbrMatchFuzzy  SearchMatch
hi! link CmpItemKindClass Type
hi! link CmpItemKindColor Keyword
hi! link CmpItemKindConstant Constant
hi! link CmpItemKindConstructor Special
hi! link CmpItemKindEnum Type
hi! link CmpItemKindEnumMember Constant
hi! link CmpItemKindEvent Identifier
hi! link CmpItemKindField Character
hi! link CmpItemKindFile Directory
hi! link CmpItemKindFolder Directory
hi! link CmpItemKindFunction Function
hi! link CmpItemKindInterface Type
hi! link CmpItemKindKeyword Keyword
hi! link CmpItemKindMethod Function
hi! link CmpItemKindModule Namespace
hi! link CmpItemKindOperator Operator
hi! link CmpItemKindProperty Identifier
hi! link CmpItemKindReference Character
hi! link CmpItemKindSnippet String
hi! link CmpItemKindStruct Type
hi! link CmpItemKindText Text
hi! link CmpItemKindUnit Namespace
hi! link CmpItemKindValue Comment
hi! link CmpItemKindVariable Identifier

if has("nvim-0.8.0")
   hi! link CmpItemKindField @field
   hi! link CmpItemKindProperty @property
endif

" Diff
call <sid>hi("DiffAdd",  s:cterm0B, s:cterm01, "")
call <sid>hi("DiffChange",  s:cterm05, s:cterm01, "")
call <sid>hi("DiffDelete",  s:cterm02, s:ctermbg, "")
call <sid>hi("DiffText",  s:cterm0D, s:cterm01, "")
call <sid>hi("DiffAdded",  s:cterm0B, s:ctermbg, "")
call <sid>hi("DiffFile",  s:cterm08, s:ctermbg, "")
call <sid>hi("DiffNewFile",  s:cterm0B, s:ctermbg, "")
call <sid>hi("DiffLine",  s:cterm0D, s:ctermbg, "")
call <sid>hi("DiffRemoved",  s:cterm08, s:ctermbg, "")

" Git
call <sid>hi("gitcommitOverflow", s:cterm08, "", "")
call <sid>hi("gitcommitSummary", s:cterm0B, "", "")
call <sid>hi("gitcommitComment", s:cterm03, "", "")
call <sid>hi("gitcommitUntracked", s:cterm03, "", "")
call <sid>hi("gitcommitDiscarded", s:cterm03, "", "")
call <sid>hi("gitcommitSelected", s:cterm03, "", "")
call <sid>hi("gitcommitHeader", s:cterm0E, "", "")
call <sid>hi("gitcommitSelectedType", s:cterm0D, "", "")
call <sid>hi("gitcommitUnmergedType", s:cterm0D, "", "")
call <sid>hi("gitcommitDiscardedType", s:cterm0D, "", "")
call <sid>hi("gitcommitBranch", s:cterm09, "", "bold")
call <sid>hi("gitcommitUntrackedFile", s:cterm0A, "", "")
call <sid>hi("gitcommitUnmergedFile", s:cterm08, "", "bold")
call <sid>hi("gitcommitDiscardedFile", s:cterm08, "", "bold")
call <sid>hi("gitcommitSelectedFile", s:cterm0B, "", "bold")

" GitGutter
hi! link GitGutterAdd            GitAddSign
hi! link GitGutterChange         GitChangeSign
hi! link GitGutterDelete         GitDeleteSign
hi! link GitGutterChangeDelete   GitChangeDeleteSign

" indent-blankline (nvim)
if has("nvim")
   call <sid>hi("@ibl.indent.char", s:cterm01, "", "")
endif

" HTML
call <sid>hi("htmlBold", s:cterm0A, "", "bold")
call <sid>hi("htmlItalic", s:cterm0E, "", "italic")
call <sid>hi("htmlEndTag", s:cterm05, "", "")
call <sid>hi("htmlTag", s:cterm05, "", "")

" JavaScript
call <sid>hi("javaScript", s:cterm05, "", "")
call <sid>hi("javaScriptBraces", s:cterm05, "", "")
call <sid>hi("javaScriptNumber", s:cterm09, "", "")
" pangloss/vim-javascript
call <sid>hi("jsOperator", s:cterm0D, "", "")
call <sid>hi("jsStatement", s:cterm0E, "", "")
call <sid>hi("jsReturn", s:cterm0E, "", "")
call <sid>hi("jsThis", s:cterm08, "", "")
call <sid>hi("jsClassDefinition", s:cterm0A, "", "")
call <sid>hi("jsFunction", s:cterm0E, "", "")
call <sid>hi("jsFuncName", s:cterm0D, "", "")
call <sid>hi("jsFuncCall", s:cterm0D, "", "")
call <sid>hi("jsClassFuncName", s:cterm0D, "", "")
call <sid>hi("jsClassMethodType", s:cterm0E, "", "")
call <sid>hi("jsRegexpString", s:cterm0C, "", "")
call <sid>hi("jsGlobalObjects", s:cterm0A, "", "")
call <sid>hi("jsGlobalNodeObjects", s:cterm0A, "", "")
call <sid>hi("jsExceptions", s:cterm0A, "", "")
call <sid>hi("jsBuiltins", s:cterm0A, "", "")

" Mail
call <sid>hi("mailQuoted1", s:cterm0A, "", "")
call <sid>hi("mailQuoted2", s:cterm0B, "", "")
call <sid>hi("mailQuoted3", s:cterm0E, "", "")
call <sid>hi("mailQuoted4", s:cterm0C, "", "")
call <sid>hi("mailQuoted5", s:cterm0D, "", "")
call <sid>hi("mailQuoted6", s:cterm0A, "", "")
call <sid>hi("mailURL", s:cterm0D, "", "")
call <sid>hi("mailEmail", s:cterm0D, "", "")

" Markdown
call <sid>hi("markdownCode", s:cterm0B, "", "")
call <sid>hi("markdownError", s:cterm05, s:ctermbg, "")
call <sid>hi("markdownCodeBlock", s:cterm0B, "", "")
call <sid>hi("markdownHeadingDelimiter", s:cterm0D, "", "")

" Matchup
call <sid>hi("MatchWord",  s:cterm0B, s:cterm01, "underline")

" NERDTree
call <sid>hi("NERDTreeDirSlash", s:cterm0D, "", "")
call <sid>hi("NERDTreeExecFile", s:cterm05, "", "")

" PHP
call <sid>hi("phpMemberSelector", s:cterm05, "", "")
call <sid>hi("phpComparison", s:cterm05, "", "")
call <sid>hi("phpParent", s:cterm05, "", "")
call <sid>hi("phpMethodsVar", s:cterm0C, "", "")

" Python
call <sid>hi("pythonOperator", s:cterm0E, "", "")
call <sid>hi("pythonRepeat", s:cterm0E, "", "")
call <sid>hi("pythonInclude", s:cterm0E, "", "")
call <sid>hi("pythonStatement", s:cterm0E, "", "")

" Ruby
call <sid>hi("rubyAttribute", s:cterm0D, "", "")
call <sid>hi("rubyConstant", s:cterm0A, "", "")
call <sid>hi("rubyInterpolationDelimiter", s:cterm0F, "", "")
call <sid>hi("rubyRegexp", s:cterm0C, "", "")
call <sid>hi("rubySymbol", s:cterm0B, "", "")
call <sid>hi("rubyStringDelimiter", s:cterm0B, "", "")

" SASS
call <sid>hi("sassidChar", s:cterm08, "", "")
call <sid>hi("sassClassChar", s:cterm09, "", "")
call <sid>hi("sassInclude", s:cterm0E, "", "")
call <sid>hi("sassMixing", s:cterm0E, "", "")
call <sid>hi("sassMixinName", s:cterm0D, "", "")

" Signify
hi! link SignifySignAdd    GitAddSign
hi! link SignifySignChange GitChangeSign
hi! link SignifySignDelete GitDeleteSign

" Startify
call <sid>hi("StartifyBracket", s:cterm03, "", "")
call <sid>hi("StartifyFile", s:cterm07, "", "")
call <sid>hi("StartifyFooter", s:cterm03, "", "")
call <sid>hi("StartifyHeader", s:cterm0B, "", "")
call <sid>hi("StartifyNumber", s:cterm09, "", "")
call <sid>hi("StartifyPath", s:cterm03, "", "")
call <sid>hi("StartifySection", s:cterm0E, "", "")
call <sid>hi("StartifySelect", s:cterm0C, "", "")
call <sid>hi("StartifySlash", s:cterm03, "", "")
call <sid>hi("StartifySpecial", s:cterm03, "", "")

" LSP
if has("nvim")
   hi! link DiagnosticError  ErrorSign
   hi! link DiagnosticWarn   WarningSign
   hi! link DiagnosticInfo   InfoSign
   hi! link DiagnosticHint   HintSign
   hi! link DiagnosticOk     OkSign

   hi! link DiagnosticFloatingError  ErrorFloat
   hi! link DiagnosticFloatingWarn   WarningFloat
   hi! link DiagnosticFloatingInfo   InfoFloat
   hi! link DiagnosticFloatingHint   HintFloat
   hi! link DiagnosticFloatingOk     OkFloat

   hi! link DiagnosticUnderlineError  ErrorHighlight
   hi! link DiagnosticUnderlineWarn   WarningHighlight
   hi! link DiagnosticUnderlineInfo   InfoHighlight
   hi! link DiagnosticUnderlineHint   HintHighlight
   hi! link DiagnosticUnderlineOk     OkHighlight

   hi! link DiagnosticsVirtualTextError    ErrorSign
   hi! link DiagnosticsVirtualTextWarning  WarningSign
   hi! link DiagnosticsVirtualTextInfo     InfoSign
   hi! link DiagnosticsVirtualTextHint     HintSign
   hi! link DiagnosticsVirtualTextOk       OkSign

   " Remove untill endif on next nvim release
   hi! link LspDiagnosticsSignError    ErrorSign
   hi! link LspDiagnosticsSignWarning  WarningSign
   hi! link LspDiagnosticsSignInfo     InfoSign
   hi! link LspDiagnosticsSignHint     HintSign

   hi! link LspDiagnosticsVirtualTextError    ErrorSign
   hi! link LspDiagnosticsVirtualTextWarning  WarningSign
   hi! link LspDiagnosticsVirtualTextInfo     InfoSign
   hi! link LspDiagnosticsVirtualTextHint     HintSign

   hi! link LspDiagnosticsFloatingError    ErrorFloat
   hi! link LspDiagnosticsFloatingWarning  WarningFloat
   hi! link LspDiagnosticsFloatingInfo     InfoFloat
   hi! link LspDiagnosticsFloatingHint     HintFloat

   hi! link LspDiagnosticsUnderlineError    ErrorHighlight
   hi! link LspDiagnosticsUnderlineWarning  WarningHighlight
   hi! link LspDiagnosticsUnderlineInfo     InfoHighlight
   hi! link LspDiagnosticsUnderlineHint     HintHighlight

   hi! link LspReferenceText   ReferenceText
   hi! link LspReferenceRead   ReferenceRead
   hi! link LspReferenceWrite  ReferenceWrite

   "  https://neovim.io/doc/user/news-0.10.html
   if has("nvim-0.10.0")
      hi! link WinSeparator VertSplit
      hi! link FloatBorder  WinSeparator
      hi! link NormalFloat  Pmenu
   endif
endif

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F s:ctermbg
