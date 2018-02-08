runtime! debian.vim

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"
"set showcmd   	  	" Show (partial) command in status line.
"set smartcase 	  	" Do smart case matching
"set hidden    	  	" Hide buffers when they are abandoned
"set mouse=a   	  	" Enable mouse usage (all modes)

if has("syntax")
  syntax on
endif

set background=dark
set showmatch  	  	" Show matching brackets.
set ignorecase 	  	" Do case insensitive matching
set incsearch  	  	" Incremental search
set autowrite  	  	" Automatically save before commands like :next and :make

set ts=4
set autoindent
set nu
set tabstop=4 shiftwidth=4
set expandtab
setlocal omnifunc=syntaxcomplete#Complete
set splitright

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set list listchars=tab:→\ ,trail:·

set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'nerdtree'
Plugin 'tagbar'
Plugin 'nerdcommenter'
Plugin 'tern_for_vim'
Plugin 'javacomplete2'
Plugin 'scrooloose/syntastic'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'lervag/vimtex'
"Plugin 'gilligan/vim-lldb'
"Plugin 'mattn/emmet-vim'
call vundle#end()
autocmd FileType java setlocal omnifunc=javacomplete#Complete

call plug#begin("~/.vim/bundle/")

Plug 'Valloric/YouCompleteMe'
Plug 'lervag/vimtex'

call plug#end()

filetype plugin indent on

""""nnoremap th  :tabfirst<CR>
""""nnoremap tj  :tabnext<CR>
""""nnoremap tk  :tabprev<CR>
""""nnoremap tl  :tablast<CR>
""""nnoremap tt  :tabedit<Space>
""""nnoremap tn  :tabnext<Space>
""""nnoremap tm  :tabm<Space>
""""nnoremap td  :tabclose<CR>
""""
""""" Alternatively use
""""""nnoremap th :tabnext<CR>
""""""nnoremap tl :tabprev<CR>

map <F2> :NERDTreeToggle<cr>
map <F3> :tabnext<cr>
map <F4> :SyntasticInfo<cr>
map <F5> :TagbarToggle<cr>
map <F6> :JCimportsAddMissing<cr>
map <F7> :JCimportsRemoveUnused<cr>
map <F12> :windo wincmd H<cr>

"colorscheme solarized
"execute pathogen#infect()

let mapleader = ","
let maplocalleader = ","
:inoremap ( ()<Esc>i
:inoremap [ []<Esc>i
:inoremap { {}<Esc>i
:inoremap " ""<Esc>i
:inoremap ' ''<Esc>i


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Syntastic Options and Configuration

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_jump = 1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_loc_list_height = 3

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

" Checkers para los distintos lenguajes.
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_c_checkers = ['gcc']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" UltiSnips Options and Configuration

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets = "<c-l>"

let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" YouCompleteMe Options and Configuration

let g:ycm_show_diagnostics_ui = 0 "default 1
let g:ycm_key_invoke_completion = '<C-Space>'

" Make YCM compatible with UltiSnips
let g:ycm_key_list_select_completion = ['<s-tab>', '<Down>', '<C-j>']
let g:ycm_key_list_previous_completion = ['<c-tab>', '<Up>', '<C-k>']

if(!exists('g:ycm_semantic_triggers'))
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
let g:ycm_confirm_extra_conf = 0


"let g:ycm_enable_diagnostic_signs = 1
"let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_always_populate_location_list = 1 "default 0
"let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
"
"let g:ycm_complete_in_strings = 1 "default 1
"let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
"let g:ycm_path_to_python_interpreter = '' "default ''
"
"let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
"let g:ycm_server_log_level = 'info' "default info
"let g:ycm_warning_symbol = '>>'
"let g:ycm_error_symbol = '>>'
"
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
"
"let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
"let g:ycm_filetype_whitelist = { '*': 1 }
"
"nnoremap <F10> :YcmForceCompileAndDiagnostics <CR>

