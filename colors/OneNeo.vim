" Vim Color File
" Name:       one_neo.vim
" Maintainer: https://github.com/nrhodes91/one_neo.vim/
" License:    Unlicense
" Based On:   https://github.com/joshdick/onedark.vim/

" Initialization

highlight clear

if exists('syntax_on')
    syntax reset
endif

set t_Co=256

let g:colors_name='OneNeo'

if !exists('g:one_neo_termcolors')
    let g:one_neo_termcolors = 256
endif

if !exists('g:one_neo_terminal_italics')
    let g:one_neo_terminal_italics = 0
endif

function! s:h(group, style, ...)
    let a:highlight = a:style

    if g:one_neo_terminal_italics == 0
        if has_key(a:highlight, 'cterm') && a:highlight['cterm'] ==# 'italic'
            unlet a:highlight.cterm
        endif
        if has_key(a:highlight, 'gui') && a:highlight['gui'] ==# 'italic'
            unlet a:highlight.gui
        endif
    endif

    let l:ctermfg = (has_key(a:highlight, 'fg') ? a:highlight.fg.cterm : 'NONE')
    let l:ctermbg = (has_key(a:highlight, 'bg') ? a:highlight.bg.cterm : 'NONE')

    execute 'highlight' a:group
                \ 'guifg='   (has_key(a:highlight, 'fg')    ? a:highlight.fg.gui   : 'NONE')
                \ 'guibg='   (has_key(a:highlight, 'bg')    ? a:highlight.bg.gui   : 'NONE')
                \ 'guisp='   (has_key(a:highlight, 'sp')    ? a:highlight.sp.gui   : 'NONE')
                \ 'gui='     (has_key(a:highlight, 'gui')   ? a:highlight.gui      : 'NONE')
                \ 'ctermfg=' . l:ctermfg
                \ 'ctermbg=' . l:ctermbg
                \ 'cterm='   (has_key(a:highlight, 'cterm') ? a:highlight.cterm    : 'NONE')
endfunction

let s:theme = {}
let s:theme['dark'] = {
            \ 'red': { 'gui': '#E06C75', 'cterm': '204', 'cterm16': '1' },
            \ 'dark_red': { 'gui': '#BE5046', 'cterm': '196', 'cterm16': '9' },
            \ 'green': { 'gui': '#98C379', 'cterm': '114', 'cterm16': '2' },
            \ 'yellow':  { 'gui': '#E5C07B', 'cterm': '180', 'cterm16': '3' },
            \ 'dark_yellow': { 'gui': '#D19A66', 'cterm': '173', 'cterm16': '11' },
            \ 'blue': { 'gui': '#61AFEF', 'cterm': '39', 'cterm16': '4' },
            \ 'purple': { 'gui': '#C678DD', 'cterm': '170', 'cterm16': '5' },
            \ 'cyan': { 'gui': '#56B6C2', 'cterm': '38', 'cterm16': '6' },
            \ 'white': { 'gui': '#ABB2BF', 'cterm': '145', 'cterm16': '7' },
            \ 'black': { 'gui': '#282C34', 'cterm': '235', 'cterm16': '0' },
            \ 'visual_black': { 'gui': 'NONE', 'cterm': 'NONE', 'cterm16': '0' },
            \ 'comment_grey': { 'gui': '#5C6370', 'cterm': '59', 'cterm16': '15' },
            \ 'gutter_fg_grey': { 'gui': '#4B5263', 'cterm': '238', 'cterm16': '15' },
            \ 'cursor_grey': { 'gui': '#2C323C', 'cterm': '236', 'cterm16': '8' },
            \ 'visual_grey': { 'gui': '#3E4452', 'cterm': '237', 'cterm16': '15' },
            \ 'menu_grey': { 'gui': '#3E4452', 'cterm': '237', 'cterm16': '8' },
            \ 'special_grey': { 'gui': '#3B4048', 'cterm': '238', 'cterm16': '15' },
            \ 'vertsplit': { 'gui': '#181A1F', 'cterm': '59', 'cterm16': '15' },
            \}
let s:theme['light'] = {
            \ 'red': { 'gui': '#E45649', 'cterm': '204', 'cterm16': '1' },
            \ 'dark_red': { 'gui': '#BE5046', 'cterm': '196', 'cterm16': '9' },
            \ 'green': { 'gui': '#50A14F', 'cterm': '114', 'cterm16': '2' },
            \ 'yellow': { 'gui': '#986801', 'cterm': '180', 'cterm16': '3' },
            \ 'dark_yellow': { 'gui': '#c78243', 'cterm': '173', 'cterm16': '11' },
            \ 'blue': { 'gui': '#4078F2', 'cterm': '39', 'cterm16': '4' },
            \ 'purple': { 'gui': '#A626A4', 'cterm': '170', 'cterm16': '5' },
            \ 'cyan': { 'gui': '#0184BC', 'cterm': '38', 'cterm16': '6' },
            \ 'white': { 'gui': '#444444', 'cterm': '145', 'cterm16': '7' },
            \ 'black': { 'gui': '#F9F9F9', 'cterm': '235', 'cterm16': '0' },
            \ 'visual_black': { 'gui': 'NONE', 'cterm': 'NONE', 'cterm16': '0' },
            \ 'comment_grey': { 'gui': '#A0A1A7', 'cterm': '59', 'cterm16': '15' },
            \ 'gutter_fg_grey': { 'gui': '#9198ac', 'cterm': '238', 'cterm16': '15' },
            \ 'cursor_grey': { 'gui': '#e2e4e9', 'cterm': '236', 'cterm16': '8' },
            \ 'visual_grey': { 'gui': '#C8CCD4', 'cterm': '237', 'cterm16': '15' },
            \ 'menu_grey': { 'gui': '#bfc4cf', 'cterm': '237', 'cterm16': '8' },
            \ 'special_grey': { 'gui': '#bfc4cf', 'cterm': '238', 'cterm16': '15' },
            \ 'vertsplit': { 'gui': '#f3f4f6', 'cterm': '59', 'cterm16': '15' },
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
let s:dark_red = s:colors.dark_red
let s:green = s:colors.green
let s:yellow = s:colors.yellow
let s:dark_yellow = s:colors.dark_yellow
let s:blue = s:colors.blue
let s:purple = s:colors.purple
let s:cyan = s:colors.cyan
let s:white = s:colors.white
let s:black = s:colors.black
let s:visual_black = s:colors.visual_black
let s:comment_grey = s:colors.comment_grey
let s:gutter_fg_grey = s:colors.gutter_fg_grey
let s:cursor_grey = s:colors.cursor_grey
let s:visual_grey = s:colors.visual_grey
let s:menu_grey = s:colors.menu_grey
let s:special_grey = s:colors.special_grey
let s:vertsplit = s:colors.vertsplit


" Syntax Groups (descriptions and ordering from `:h w18`)

call s:h('Comment', { 'fg': s:comment_grey, 'gui': 'italic', 'cterm': 'italic' })
call s:h('Constant', { 'fg': s:cyan })
call s:h('String', { 'fg': s:green })
call s:h('Character', { 'fg': s:green })
call s:h('Number', { 'fg': s:dark_yellow })
call s:h('Boolean', { 'fg': s:dark_yellow })
call s:h('Float', { 'fg': s:dark_yellow })
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
call s:h('SpecialComment', { 'fg': s:comment_grey })
call s:h('Debug', {})
call s:h('Underlined', { 'gui': 'underline', 'cterm': 'underline' })
call s:h('Ignore', {})
call s:h('Error', { 'fg': s:red })
call s:h('Todo', { 'fg': s:purple })

"

" Highlighting Groups (descriptions and ordering from `:h highlight-groups`)
call s:h('ColorColumn', { 'bg': s:cursor_grey })
call s:h('Conceal', {})
call s:h('Cursor', { 'fg': s:black, 'bg': s:blue })
call s:h('CursorIM', {})
call s:h('CursorColumn', { 'bg': s:cursor_grey })
" no cursorline in diff mode
if &diff
    call s:h('CursorLine', { 'gui': 'underline' })
else
    call s:h('CursorLine', { 'bg': s:cursor_grey })
endif
call s:h('Directory', { 'fg': s:blue })
call s:h('DiffAdd', { 'bg': s:green, 'fg': s:black })
call s:h('DiffChange', { 'fg': s:yellow, 'gui': 'underline', 'cterm': 'underline' })
call s:h('DiffDelete', { 'bg': s:red, 'fg': s:black })
call s:h('DiffText', { 'bg': s:yellow, 'fg': s:black })
call s:h('ErrorMsg', { 'fg': s:red })
call s:h('VertSplit', { 'fg': s:vertsplit })
call s:h('Folded', { 'fg': s:comment_grey })
call s:h('FoldColumn', {})
call s:h('SignColumn', {})
call s:h('IncSearch', { 'fg': s:yellow, 'bg': s:comment_grey })
call s:h('LineNr', { 'fg': s:gutter_fg_grey })
call s:h('CursorLineNr', {})
call s:h('MatchParen', { 'fg': s:blue, 'gui': 'underline' })
call s:h('ModeMsg', {})
call s:h('MoreMsg', {})
call s:h('NonText', { 'fg': s:special_grey })
call s:h('Normal', { 'fg': s:white, 'bg': s:black })

" updating Normal will also update the background
" variable depending on the color used. This needs
" to be overridden immediately afterwards
if s:is_dark
    set background=dark
else
    set background=light
endif

call s:h('Pmenu', { 'bg': s:menu_grey })
call s:h('PmenuSel', { 'fg': s:black, 'bg': s:blue })
call s:h('PmenuSbar', { 'bg': s:special_grey })
call s:h('PmenuThumb', { 'bg': s:white })
call s:h('Question', { 'fg': s:purple })
call s:h('QuickFixLine', { 'fg': s:black, 'bg': s:yellow })
call s:h('Search', { 'fg': s:black, 'bg': s:yellow })
call s:h('SpecialKey', { 'fg': s:special_grey })
call s:h('SpellBad', { 'fg': s:red, 'gui': 'underline', 'cterm': 'underline' })
call s:h('SpellCap', { 'fg': s:dark_yellow })
call s:h('SpellLocal', { 'fg': s:dark_yellow })
call s:h('SpellRare', { 'fg': s:dark_yellow })
call s:h('StatusLine', { 'fg': s:white, 'bg': s:cursor_grey, 'gui': 'bold' })
call s:h('StatusLineNC', { 'fg': s:comment_grey })
call s:h('TabLine', { 'fg': s:comment_grey })
call s:h('TabLineFill', {})
call s:h('TabLineSel', { 'fg': s:white })
call s:h('Terminal', { 'fg': s:white, 'bg': s:black })
call s:h('Title', { 'fg': s:green })
call s:h('Visual', { 'fg': s:visual_black, 'bg': s:visual_grey })
call s:h('VisualNOS', { 'bg': s:visual_grey })
call s:h('WarningMsg', { 'fg': s:yellow })
call s:h('WildMenu', { 'fg': s:black, 'bg': s:blue })

" Shell
"call s:h("shTestOpr", { "fg": s:cyan })
"call s:h("shDerefVarArray", { "fg": s:cyan, "gui": "none" })
"call s:h("shFunctionKey", { "gui": "bold" })
hi link shFunctionKey NONE
call s:h('shFunctionKey', { 'fg': s:white, 'gui': 'italic' })
call s:h('shSet', { 'fg': s:purple, 'gui': 'italic' })

" Python
hi link pythonStatement NONE
call s:h('pythonStatement', { 'gui': 'italic' })
call s:h('pythonStrFormatting', { 'fg': s:white, 'gui': 'bold' })

let g:terminal_ansi_colors = [
            \ s:black.gui, s:red.gui, s:green.gui, s:yellow.gui,
            \ s:blue.gui, s:purple.gui, s:cyan.gui, s:white.gui,
            \ s:visual_grey.gui, s:dark_red.gui, s:green.gui, s:dark_yellow.gui,
            \ s:blue.gui, s:purple.gui, s:cyan.gui, s:comment_grey.gui
            \]

if has('nvim')
    let g:terminal_color_0 =  s:black.gui
    let g:terminal_color_1 =  s:red.gui
    let g:terminal_color_2 =  s:green.gui
    let g:terminal_color_3 =  s:yellow.gui
    let g:terminal_color_4 =  s:blue.gui
    let g:terminal_color_5 =  s:purple.gui
    let g:terminal_color_6 =  s:cyan.gui
    let g:terminal_color_7 =  s:white.gui
    let g:terminal_color_8 =  s:visual_grey.gui
    let g:terminal_color_9 =  s:dark_red.gui
    let g:terminal_color_10 = s:green.gui
    let g:terminal_color_11 = s:dark_yellow.gui
    let g:terminal_color_12 = s:blue.gui
    let g:terminal_color_13 = s:purple.gui
    let g:terminal_color_14 = s:cyan.gui
    let g:terminal_color_15 = s:comment_grey.gui
    let g:terminal_color_background = g:terminal_color_0
    let g:terminal_color_foreground = g:terminal_color_7
endif