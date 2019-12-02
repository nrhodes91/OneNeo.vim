" Vim Color File
" =============================================================================
" Name:       one_neo.vim
" Maintainer: https://github.com/nrhodes91/OneNeo.vim/
" License:    Unlicense
" Based On:   https://github.com/joshdick/onedark.vim/
" =============================================================================

" Initialization
highlight clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name='OneNeo'

if !exists('g:one_neo_termcolors')
    let g:one_neo_termcolors = 256
endif

if !exists('g:one_neo_terminal_italics')
    let g:one_neo_terminal_italics = 0
endif

function! s:h(group, style, ...)
    let l:highlight = a:style

    if g:one_neo_terminal_italics == 0
        if has_key(l:highlight, 'cterm') && l:highlight['cterm'] ==# 'italic'
            unlet l:highlight.cterm
        endif
        if has_key(l:highlight, 'gui') && l:highlight['gui'] ==# 'italic'
            unlet l:highlight.gui
        endif
    endif

    if has_key(l:highlight, 'link')
        execute 'highlight link' a:group l:highlight.link
    else
        execute 'highlight link' a:group 'NONE'

        execute 'highlight' a:group
                    \ 'guifg='   . (has_key(l:highlight, 'fg')    ? l:highlight.fg.gui   : 'NONE')
                    \ 'guibg='   . (has_key(l:highlight, 'bg')    ? l:highlight.bg.gui   : 'NONE')
                    \ 'guisp='   . (has_key(l:highlight, 'sp')    ? l:highlight.sp.gui   : 'NONE')
                    \ 'gui='     . (has_key(l:highlight, 'gui')   ? l:highlight.gui      : 'NONE')
                    \ 'ctermfg=' . (has_key(l:highlight, 'fg')    ? l:highlight.fg.cterm : 'NONE')
                    \ 'ctermbg=' . (has_key(l:highlight, 'bg')    ? l:highlight.bg.cterm : 'NONE')
                    \ 'cterm='   . (has_key(l:highlight, 'cterm') ? l:highlight.cterm    : 'NONE')
    endif
endfunction

let s:theme = {}
let s:theme['dark'] = {
            \ 'red': { 'gui': '#E06C75', 'cterm': '204', 'cterm16': '1' },
            \ 'green': { 'gui': '#98C379', 'cterm': '114', 'cterm16': '2' },
            \ 'yellow':  { 'gui': '#E5C07B', 'cterm': '180', 'cterm16': '3' },
            \ 'orange': { 'gui': '#D19A66', 'cterm': '173', 'cterm16': '11' },
            \ 'blue': { 'gui': '#61AFEF', 'cterm': '39', 'cterm16': '4' },
            \ 'purple': { 'gui': '#C678DD', 'cterm': '170', 'cterm16': '5' },
            \ 'cyan': { 'gui': '#56B6C2', 'cterm': '38', 'cterm16': '6' },
            \ 'white': { 'gui': '#9E9E9E', 'cterm': '145', 'cterm16': '7' },
            \ 'black': { 'gui': '#282C34', 'cterm': '235', 'cterm16': '0' },
            \ 'grey': { 'gui': '#5C6370', 'cterm': '59', 'cterm16': '15' },
            \ 'dark_grey': { 'gui': '#1b1d23', 'cterm': '239', 'cterm16': '15' },
            \ 'visual_grey': { 'gui': '#353b45', 'cterm': '59', 'cterm16': '15' },
            \ 'cursorline': { 'gui': '#2e333d', 'cterm': '59', 'cterm16': '15' },
            \ 'visual_black': { 'gui': 'NONE', 'cterm': 'NONE', 'cterm16': '0' },
            \}
let s:theme['light'] = {
            \ 'red': { 'gui': '#b1271b', 'cterm': '204', 'cterm16': '1' },
            \ 'green': { 'gui': '#387138', 'cterm': '114', 'cterm16': '2' },
            \ 'yellow': { 'gui': '#9c5a1c', 'cterm': '180', 'cterm16': '3' },
            \ 'orange': { 'gui': '#9c5a1c', 'cterm': '173', 'cterm16': '11' },
            \ 'blue': { 'gui': '#0e49c8', 'cterm': '39', 'cterm16': '4' },
            \ 'purple': { 'gui': '#871785', 'cterm': '170', 'cterm16': '5' },
            \ 'cyan': { 'gui': '#016793', 'cterm': '38', 'cterm16': '6' },
            \ 'white': { 'gui': '#1A1A1A', 'cterm': '145', 'cterm16': '7' },
            \ 'black': { 'gui': '#E5E5E5', 'cterm': '235', 'cterm16': '0' },
            \ 'grey': { 'gui': '#999999', 'cterm': '59', 'cterm16': '15' },
            \ 'dark_grey': { 'gui': '#1b1d23', 'cterm': '239', 'cterm16': '15' },
            \ 'visual_grey': { 'gui': '#cccccc', 'cterm': '59', 'cterm16': '15' },
            \ 'cursorline': { 'gui': '#d9d9d9', 'cterm': '59', 'cterm16': '15' },
            \ 'visual_black': { 'gui': 'NONE', 'cterm': 'NONE', 'cterm16': '0' },
            \}

let s:selected_variant = 'dark'
let s:is_dark=(&background ==# 'dark')
if s:is_dark
    let s:selected_variant = 'dark'
else
    let s:selected_variant = 'light'
endif
let s:colors = s:theme[s:selected_variant]

let s:red = s:colors.red
let s:green = s:colors.green
let s:yellow = s:colors.yellow
let s:orange = s:colors.orange
let s:blue = s:colors.blue
let s:purple = s:colors.purple
let s:cyan = s:colors.cyan
let s:white = s:colors.white
let s:black = s:colors.black
let s:visual_black = s:colors.visual_black
let s:grey = s:colors.grey
let s:dark_grey = s:colors.dark_grey
let s:visual_grey = s:colors.visual_grey
let s:cursorline = s:colors.cursorline

" :h w18
call s:h('Normal', { 'fg': s:white, 'bg': s:black })
" updating Normal will also update the background
" variable depending on the color used. This needs
" to be overridden immediately afterwards
if s:is_dark
    set background=dark
else
    set background=light
endif

call s:h('Comment', { 'fg': s:grey, 'gui': 'italic', 'cterm': 'italic' })
call s:h('Constant', { 'fg': s:cyan })
call s:h('String', { 'fg': s:green })
call s:h('Character', { 'fg': s:green })
call s:h('Number', { 'fg': s:orange })
call s:h('Boolean', { 'fg': s:orange })
call s:h('Float', { 'fg': s:orange })
call s:h('Identifier', { 'fg': s:red })
call s:h('Function', { 'fg': s:blue })
call s:h('Statement', { 'fg': s:purple })
call s:h('Conditional', { 'fg': s:purple })
call s:h('Repeat', { 'fg': s:purple })
call s:h('Label', { 'fg': s:purple })
call s:h('Operator', { 'fg': s:purple })
call s:h('Keyword', { 'fg': s:red })
call s:h('Exception', { 'fg': s:purple })
call s:h('PreProc', { 'fg': s:yellow })
call s:h('Include', { 'fg': s:blue })
call s:h('Define', { 'fg': s:purple })
call s:h('Macro', { 'fg': s:purple })
call s:h('PreCondit', { 'fg': s:yellow })
call s:h('Type', { 'fg': s:yellow })
call s:h('StorageClass', { 'fg': s:yellow })
call s:h('Structure', { 'fg': s:yellow })
call s:h('Typedef', { 'fg': s:yellow })
call s:h('Special', { 'fg': s:blue })
call s:h('SpecialChar', {})
call s:h('Tag', {})
call s:h('Delimiter', {})
call s:h('SpecialComment', { 'fg': s:grey })
call s:h('Debug', {})
call s:h('Underlined', { 'gui': 'underline', 'cterm': 'underline' })
call s:h('Ignore', {})
call s:h('Error', { 'fg': s:red })
call s:h('Todo', { 'fg': s:purple })

" :h highlight-groups
call s:h('ColorColumn', { 'bg': s:grey })
call s:h('Conceal', {})
call s:h('Cursor', { 'fg': s:black, 'bg': s:blue })
call s:h('CursorIM', {})
call s:h('CursorColumn', { 'bg': s:cursorline })
" no cursorline in diff mode
if &diff
    call s:h('CursorLine', { 'gui': 'underline' })
else
    call s:h('CursorLine', { 'bg': s:cursorline })
endif
call s:h('CursorLineNr', { 'gui': 'bold' })
call s:h('Directory', { 'fg': s:blue })
call s:h('DiffAdd', { 'bg': s:green, 'fg': s:black })
call s:h('DiffChange', { 'fg': s:yellow, 'gui': 'underline', 'cterm': 'underline' })
call s:h('DiffDelete', { 'bg': s:red, 'fg': s:black })
call s:h('DiffText', { 'bg': s:yellow, 'fg': s:black })
call s:h('ErrorMsg', { 'fg': s:red })
call s:h('VertSplit', { 'fg': s:grey })
call s:h('Folded', { 'fg': s:grey })
call s:h('FoldColumn', {})
call s:h('SignColumn', {})
call s:h('IncSearch', { 'fg': s:yellow, 'bg': s:grey })
call s:h('LineNr', { 'fg': s:grey })
call s:h('MatchParen', { 'fg': s:blue, 'gui': 'underline' })
call s:h('ModeMsg', {})
call s:h('MoreMsg', {})
call s:h('NonText', { 'fg': s:grey })
call s:h('Pmenu', { 'bg': s:dark_grey })
call s:h('PmenuSel', { 'fg': s:black, 'bg': s:blue })
call s:h('PmenuSbar', { 'bg': s:grey })
call s:h('PmenuThumb', { 'bg': s:white })
call s:h('Question', { 'fg': s:purple })
call s:h('QuickFixLine', { 'fg': s:black, 'bg': s:yellow })
call s:h('Search', { 'fg': s:black, 'bg': s:yellow })
call s:h('SpecialKey', { 'fg': s:grey })
call s:h('SpellBad', { 'fg': s:red, 'gui': 'underline', 'cterm': 'underline' })
call s:h('SpellCap', { 'fg': s:orange })
call s:h('SpellLocal', { 'fg': s:orange })
call s:h('SpellRare', { 'fg': s:orange })
call s:h('StatusLine', { 'fg': s:white })
call s:h('StatusLineNC', { 'fg': s:grey })
call s:h('TabLine', { 'fg': s:grey })
call s:h('TabLineFill', {})
call s:h('TabLineSel', { 'fg': s:white })
call s:h('Terminal', { 'fg': s:white, 'bg': s:black })
call s:h('Title', { 'fg': s:green })
call s:h('Visual', { 'fg': s:visual_black, 'bg': s:visual_grey })
call s:h('VisualNOS', { 'bg': s:visual_grey })
call s:h('WarningMsg', { 'fg': s:yellow })
call s:h('WildMenu', { 'fg': s:black, 'bg': s:cyan })

" Shell
"call s:h("shTestOpr", { 'fg': s:cyan })
"call s:h("shDerefVarArray", { 'fg': s:cyan, 'gui': 'none' })
"call s:h("shFunctionKey", { 'gui': 'bold' })
call s:h('shFunctionKey', { 'fg': s:white })
call s:h('shSet', { 'fg': s:purple })

" Python
"call s:h('pythonStatement', { 'fg': s:blue, 'gui': 'bold' })
"call s:h('pythonStrFormatting', { 'fg': s:white, 'gui': 'bold' })
call s:h('pythonException', { 'fg': s:blue, 'gui': 'bold' })
call s:h('pythonExClass', { 'fg': s:red, 'gui': 'bold' })
call s:h('pythonImport', { 'fg': s:blue, 'gui': 'bold' })
hi link pythonRun Comment
hi link pythonBytesEscape String

" Git
call s:h('diffAdded', { 'fg': s:green })
call s:h('diffRemoved', { 'fg': s:red })
call s:h('diffSubname', { })
call s:h('diffLine', { 'fg': s:cyan })
call s:h('diffFile', { 'gui': 'bold' })
call s:h('diffNewFile', { 'gui': 'bold' })
call s:h('diffIndexLine', { 'gui': 'bold' })
call s:h('gitcommitBranch', { 'fg': s:purple, 'gui': 'bold' })
call s:h('gitcommitSelectedFile', { 'fg': s:cyan, 'gui': 'bold' })
call s:h('gitcommitSelectedType', { 'fg': s:green })
call s:h('gitcommitDiscardedType', { 'fg': s:red })
call s:h('gitcommitSelectedFile', { 'fg': s:green })
call s:h('gitcommitDiscardedFile', { 'fg': s:red })
call s:h('gitcommitUnmergedFile', { 'fg': s:yellow })
call s:h('gitcommitUntrackedFile', { 'fg': s:cyan })
call s:h('gitcommitHeader', { })


" GitGutter
call s:h('GitGutterAdd', { 'fg': s:green })
call s:h('GitGutterChange', { 'fg': s:yellow })
call s:h('GitGutterDelete', { 'fg': s:red })

" Vim
hi link vimCommentTitle Constant
hi link vimUserFunc NONE

" Hosts
hi link hostsFirstWord Constant
