call plug#begin('~/.config/nvim/plug')

Plug 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '/Users/eyefrog/.config/nvim/plug/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_semantic_triggers = {'haskell' : ['.']}

Plug 'w0rp/ale'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
highlight clear ALEErrorSign
highlight clear ALEWarningSign

Plug 'python-mode/python-mode', { 'branch': 'develop' }
let g:pymode_python = 'python3'

Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme = "tomorrow"
let g:airline_section_error = '%{ALEGetStatusLine()}'

Plug 'edkolev/tmuxline.vim'
let g:tmuxline_powerline_separators = 0

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger       = "<c-k>"
let g:UltiSnipsJumpForwardTrigger  = "<c-f>"
let g:UltiSnipsJumpBackwardTrigger = "<c-b>"
Plug 'honza/vim-snippets'

Plug 'majutsushi/tagbar'
let tagbar_right=1
nnoremap <Leader>tl :TagbarToggle<CR>
let g:tagbar_compact=1

Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/paredit.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Mizuchi/STL-Syntax'
Plug 'vim-scripts/a.vim'
Plug 'lervag/vimtex'


" *.cpp 和 *.h 间切换
nmap <Leader>ch :A<CR>
" 子窗口中显示 *.cpp 或 *.h
nmap <Leader>sch :AS<CR>

Plug 'sjl/tslime.vim'
let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<leader>t'
let g:tslime_visual_mapping = '<leader>t'
let g:tslime_vars_mapping = '<leader>T'

Plug 'scrooloose/nerdtree'
nmap <Leader>tr :NERDTreeToggle<CR>

Plug 'Yggdroot/indentLine'
Plug 'chilicuil/vim-sml-coursera'

Plug 'eagletmt/neco-ghc'
Plug 'neovimhaskell/haskell-vim'
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

call plug#end()

"Basic
color gruvbox
"color Tomorrow-Night-Eighties
set background=dark
set guifont=Menlo\ for\ powerline

set number
set relativenumber
set expandtab
set ruler
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cursorline
set scrolloff=10
set ignorecase
set gcr=a:block-blinkon0
set foldmethod=syntax
set nofoldenable
let g:rehash256 = 1
set fileencodings=utf-8,chinese,latin-1

"Directories for swp files
set nobackup
set nowritebackup
set noswapfile

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

syntax on
syntax enable
filetype plugin indent on

let mapleader = ";"

inoremap jk <Esc>
inoremap jj <Esc>

" <F5>编译和运行C程序
map <F5> :call CompileRunClang()<CR>
func! CompileRunClang()
    exec "w"
    exec "!clang % -o %<"
    exec "! ./%<"
endfunc

" <F6>编译和运行C++程序
map <F6> :call CompileRunCpp()<CR>
func! CompileRunCpp()
    exec "w"
    exec "!clang++ % -o %<"
    exec "! ./%<"
endfunc
