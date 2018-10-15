    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc

call plug#begin('~/.local/share/nvim/plugged')
"Plug 'rlue/vim-getting-things-down'
Plug 'nightsense/simplifysimplify'
Plug 'vim-latex/vim-latex'
" http://vim-latex.sourceforge.net/documentation/latex-suite-quickstart/lsq-keyboard-shortcuts.html
Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'jalvesaq/Nvim-R'
Plug 'ncm2/ncm2'
Plug 'gaalcaras/ncm-R'

Plug 'SirVer/ultisnips'

Plug 'mileszs/ack.vim'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'scrooloose/nerdtree'
let NERDTreeShowLineNumbers=1 "nerdtree linenumbers
noremap <leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

Plug 'bling/vim-airline'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-fugitive'
Plug 'jceb/vim-orgmode'
"Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'dkarter/bullets.vim'
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

"themes
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'

"Plug 'nightsense/night-and-day'
Plug 'OmniSharp/omnisharp-vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'kshenoy/vim-signature'

" distraction free writing
Plug 'junegunn/goyo.vim'
Plug 'jacekd/vim-iawriter'
Plug 'junegunn/limelight.vim'
Plug 'bilalq/lite-dfm'

Plug 'vim-scripts/utl.vim'

" fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'vim-scripts/scrollfix'
let g:scrollfix=-1
noremap <leader>fj :let g:scrollfix=50<CR>
noremap <leader>fn :let g:scrollfix=-1<CR>

Plug 'Alok/notational-fzf-vim'
let g:nv_search_paths = ['~/org', '~/Dropbox/todo', './notes.md', '.notes.org']
let g:nv_ignore_pattern = ['*archive']
call plug#end()
" Plugin settings
"
filetype plugin on
filetype plugin indent on

" night-and-day
"let g:nd_themes = [
"  \ ['sunrise+0', 'badwolf', 'light' ],
  "\ ['sunset+0',  'gruvbox', 'dark'  ],
  "\ ]
"let g:nd_latitude = '50'
"let g:nd_timeshift = '40'

set cursorline
let mapleader=","

fun! SyntasticToggleQuiet(k, v)
  let idx = index(g:syntastic_quiet_messages[a:k], a:v)
  if idx == -1
    call add(g:syntastic_quiet_messages[a:k], a:v)
    echom 'Syntastic: '.a:k.':'.a:v.' disabled (filtered).'
  else
    call remove(g:syntastic_quiet_messages[a:k], idx)
    echom 'Syntastic: '.a:k.':'.a:v.' enabled (not filtered).'
  endif
endfun
command! SyntasticToggleWarnings call SyntasticToggleQuiet('level', 'warnings')
command! SyntasticToggleStyle    call SyntasticToggleQuiet('type', 'style')
let g:syntastic_quiet_messages = { "level": [],
      \ 'type': ['style'] }
" let g:syntastic_quiet_messages = {
        \ "regex":   'missing-docstring'}
nnoremap <leader>e :SyntasticToggleMode<CR>
nnoremap <leader>w :SyntasticToggleWarnings<CR>

nnoremap <leader>j :lne<CR>
nnoremap <leader>k :lprev<CR>
let g:vim_markdown_math = 1 "markdown math
"stop highlight after search
nnoremap <leader><space> :nohlsearch<CR> 
" edit nvim-init
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR> 
" edit zsh-init
nnoremap <leader>ez :vsp ~/.zshrc<CR> 
" source vim-init after changes
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR> 

" R
imap <leader>- <space><-<space>
imap <leader>p <space>%>%

inoremap <leader><leader> <Esc>:w<CR> 
" remap movement for multiline navigation
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
" let return create a blank line
noremap <CR> o<Esc>
noremap <S-Enter> O<Esc>

" change pwd to current file's dir
noremap <leader>cd :cd %:p:h<CR>
noremap <leader>o :Utl<CR>
let g:utl_cfg_hdl_scm_http = "silent !open -a Safari '%u'"

"" theme
colorscheme badwolf

"" tabs, folding
set tabstop=4
set shiftwidth=4
set expandtab
"set sessionoptions+=folds
set fdm=manual
"
let g:python3_host_prog = '/usr/local/bin/python3'
let g:UltiSnipsExpandTrigger="<tab>"


" run python files below
autocmd FileType python nnoremap <buffer> <leader>r :exec '!python' shellescape(@%, 1)<cr>
" run python files in other tmux window
autocmd FileType python nnoremap <buffer> <leader>m :!tmux run-shell -t 1 'python %'<CR> 
autocmd FileType org set fdm=manual

let R_assign_map = '<A-->'
set rnu

noremap <leader>l :Limelight!!<CR>
noremap <leader>g :Goyo<CR>
noremap <leader>z :LiteDFMToggle<CR>
set scrolloff=7

function! s:goyo_enter()
    set relativenumber
    set scrolloff=99
    Limelight
    " ...
endfunction

function! s:goyo_leave()
   Limelight!
   set scrolloff=7
   " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
