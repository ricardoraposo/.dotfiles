highlight clear

function s:highlight(group, bg, fg, style)
  let gui = a:style == '' ? '' : 'gui=' . a:style
  let fg = a:fg == '' ? '' : 'guifg=' . a:fg
  let bg = a:bg == '' ? '' : 'guibg=' . a:bg
  exec 'hi ' . a:group . ' ' . bg . ' ' . fg  . ' ' . gui
endfunction

let s:LightBlue      = '#69C3FF'
let s:LightGreen     = '#A4EF58'
let s:LightRed       = '#E35535'
let s:DarkBrown      = '#392b33'
let s:SteelBlue      = '#8196b5'
let s:DarkSlate      = '#3a465a'
let s:LightPurple    = '#B78AFF'
let s:Gold           = '#EACD61'
let s:CoralRed       = '#FF738A'
let s:MutedBlue      = '#656f82'
let s:DarkNavy       = '#181f2c'
let s:SlateGray      = '#586172'
let s:Aqua           = '#22ECDB'
let s:BrightGreen    = '#3CEC85'
let s:DenimBlue      = '#4a5e84'
let s:Gray           = '#5f6775'
let s:ForestGreen    = '#20413f'
let s:LightGray      = '#d0d7e4'
let s:Charcoal       = '#404a5f'
let s:DarkGray       = '#1c2433'
let s:Orange         = '#FF955C'

call s:highlight('Type', '', s:LightGreen, '')
call s:highlight('Comment', '', s:SlateGray, 'italic')
call s:highlight('Constant', '', s:LightRed, '')
call s:highlight('Function', '', s:LightBlue, '')
call s:highlight('Conditional', '', s:Gold, '')
call s:highlight('Conditional', '', s:Gold, '')
call s:highlight('Repeat', '', s:Gold, '')
call s:highlight('Operator', '', s:Gray, '')
call s:highlight('Type', '', s:Aqua, '')
call s:highlight('String', '', s:BrightGreen, '')
call s:highlight('Type', '', s:LightPurple, '')
call s:highlight('Identifier', '', s:CoralRed, '')
call s:highlight('Number', '', s:Orange, '')
call s:highlight('StatusLine', s:MutedBlue, s:DarkGray, '')
call s:highlight('WildMenu', s:DarkGray, s:LightGray, '')
call s:highlight('Pmenu', s:DarkGray, s:LightGray, '')
call s:highlight('PmenuSel', s:LightGray, s:DarkGray, '')
call s:highlight('PmenuThumb', s:DarkGray, s:LightGray, '')
call s:highlight('DiffAdd', s:ForestGreen, '', '')
call s:highlight('DiffDelete', s:DarkBrown, '', '')
call s:highlight('Normal', s:DarkGray, s:LightGray, '')
call s:highlight('Visual', s:DarkSlate, '', '')
call s:highlight('CursorLine', s:DarkSlate, '', '')
call s:highlight('ColorColumn', s:DarkSlate, '', '')
call s:highlight('SignColumn', s:DarkGray, '', '')
call s:highlight('LineNr', '', s:Charcoal, '')
call s:highlight('TabLine', s:DarkNavy, s:DenimBlue, '')
call s:highlight('TabLineSel', s:SteelBlue, s:DarkGray, '')
call s:highlight('TabLineFill', s:DarkNavy, s:DenimBlue, '')
call s:highlight('TSPunctDelimiter', '', s:LightGray, '')
call s:highlight('Special', '', s:Aqua, '')
call s:highlight('DiagnosticDeprecated', '', '', 'strikethrough')

highlight! link TSTagDelimiter Type
highlight! link TSParameter Constant
highlight! link TSConditional Conditional
highlight! link Repeat Conditional
highlight! link TSTag MyTag
highlight! link Operator Keyword
highlight! link TSLabel Type
highlight! link TSType Type
highlight! link TSConstant Constant
highlight! link Whitespace Comment
highlight! link TSKeyword Keyword
highlight! link Macro Function
highlight! link TSFuncMacro Macro
highlight! link CursorLineNr Identifier
highlight! link TSComment Comment
highlight! link TSFunction Function
highlight! link TSString String
highlight! link TSRepeat Repeat
highlight! link Folded Comment
highlight! link TSProperty TSField
highlight! link TSPunctBracket MyTag
highlight! link TSParameterReference TSParameter
highlight! link TSNamespace TSType
highlight! link TSPunctSpecial TSPunctDelimiter
highlight! link TSField Constant
highlight! link TSNumber Number
highlight! link TSFloat Number
highlight! link TSConstBuiltin TSVariableBuiltin
highlight! link TSOperator Operator
highlight! link TelescopeNormal Normal
highlight! link Conditional Operator
highlight! link NonText Comment

" Treesitter

" keyword
call s:highlight('@keyword', '', s:Aqua, '')
call s:highlight('@keyword.import', '', s:Gold, '')
call s:highlight('@keyword.coroutine', '', s:Gold, '')

" type
call s:highlight('@type', '', s:LightPurple, '')

" variable
call s:highlight('@variable', '', s:CoralRed, '')
call s:highlight('@variable.member', '', s:LightGray, '')

" punctuation
call s:highlight('@punctuation.bracket', '', s:Gold, '')
call s:highlight('@punctuation.special', '', s:DenimBlue, '')

" tag
call s:highlight('@tag', '', s:Gold, '')
call s:highlight('@tag.tsx', '', s:LightPurple, '')

call s:highlight('@tag.builtin', '', s:LightBlue, '')
call s:highlight('@tag.attribute', '', s:Gold, '')
call s:highlight('@tag.delimiter', '', s:LightBlue, '')

" markup
call s:highlight('@markup.heading.1', '', s:LightGray, '')


" NvimTree
call s:highlight('NvimTreeFolderName', '', s:Aqua, '')

