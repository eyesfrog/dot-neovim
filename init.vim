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


Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme="tomorrow"

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

syntax on
syntax enable
filetype plugin indent on

let mapleader = ";"

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
