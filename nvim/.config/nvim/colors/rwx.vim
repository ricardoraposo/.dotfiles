set background=dark
set notermguicolors

highlight clear
syntax on

hi Normal guibg=NONE ctermbg=NONE
hi StatusLine ctermfg=cyan ctermbg=NONE
hi StatusLineNC ctermfg=black ctermbg=NONE
hi Normal ctermbg=NONE
hi Special ctermfg=13
hi Function ctermfg=121 ctermbg=NONE cterm=bold
hi Type ctermfg=cyan ctermbg=NONE cterm=bold
hi LineNr ctermfg=black ctermbg=NONE
hi SpecialKey ctermfg=black ctermbg=NONE
hi Identifier guifg=NONE ctermfg=NONE
hi ModeMsg ctermfg=black cterm=NONE ctermbg=NONE
hi MoreMsg ctermfg=black ctermbg=NONE
hi NonText ctermfg=black ctermbg=NONE
hi vimGlobal ctermfg=black ctermbg=NONE
hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
hi Error ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
hi Search ctermbg=236 ctermfg=darkred
hi vimTodo ctermbg=236 ctermfg=darkred
hi Todo ctermbg=236 ctermfg=darkred
hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
hi FoldColumn ctermbg=NONE cterm=NONE ctermfg=NONE
hi MatchParen ctermbg=236 ctermfg=darkred
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi MatchParen ctermbg=NONE ctermfg=81
hi Conditional ctermbg=NONE ctermfg=yellow
hi Pmenu ctermbg=NONE ctermfg=white
hi Comment ctermbg=NONE ctermfg=241

" color overrides
au FileType * hi StatusLine ctermfg=black ctermbg=NONE
au FileType * hi StatusLineNC ctermfg=black ctermbg=NONE
au FileType * hi Normal ctermbg=NONE
au FileType * hi Special ctermfg=cyan
au FileType * hi LineNr ctermfg=black ctermbg=NONE
au FileType * hi SpecialKey ctermfg=black ctermbg=NONE
au FileType * hi ModeMsg ctermfg=yellow cterm=NONE ctermbg=NONE
au FileType * hi MoreMsg ctermfg=black ctermbg=NONE
au FileType * hi NonText ctermfg=black ctermbg=NONE
au FileType * hi vimGlobal ctermfg=black ctermbg=NONE
au FileType * hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Error ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Search ctermbg=236 ctermfg=darkred
au FileType * hi vimTodo ctermbg=236 ctermfg=darkred
au FileType * hi Todo ctermbg=236 ctermfg=darkred
au FileType * hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
au FileType * hi MatchParen ctermbg=236 ctermfg=darkred
au FileType markdown,pandoc hi Title ctermfg=yellow ctermbg=NONE
au FileType markdown,pandoc hi Operator ctermfg=yellow ctermbg=NONE
au FileType markdown,pandoc set tw=0
au FileType yaml hi yamlBlockMappingKey ctermfg=NONE
au FileType yaml set sw=2
au FileType bash set sw=2
au FileType c set sw=8
au FileType markdown,pandoc noremap j gj
au FileType markdown,pandoc noremap k gk

" making treesitter stop ruining everything
hi @include ctermbg=NONE ctermfg=yellow guibg=NONE guifg=yellow cterm=NONE
hi @variable ctermbg=NONE ctermfg=white guibg=white guifg=white
hi @field ctermbg=NONE ctermfg=white guibg=white guifg=white cterm=NONE gui=NONE
hi @property ctermbg=NONE ctermfg=cyan guibg=NONE guifg=cyan cterm=NONE
hi @keyword ctermbg=NONE ctermfg=121 cterm=NONE
hi @function ctermbg=NONE ctermfg=121 cterm=bold
hi @function.builtin ctermbg=NONE ctermfg=cyan guibg=NONE guifg=cyan cterm=bold
hi @keyword.function ctermbg=NONE ctermfg=yellow guibg=NONE guifg=yellow cterm=NONE
hi @keyword.return ctermfg=yellow
hi @method.call ctermfg=121 cterm=bold
hi @punctuation.bracket ctermbg=NONE ctermfg=white guibg=white guifg=white cterm=NONE gui=NONE
hi @punctuation.delimiter ctermbg=NONE ctermfg=white guibg=white guifg=white cterm=NONE gui=NONE
