call plug#begin('~/.local/share/nvim/plugged')
"Plug 'rlue/vim-getting-things-down'
Plug 'nightsense/simplifysimplify'
Plug 'vim-latex/vim-latex'
" http://vim-latex.sourceforge.net/documentation/latex-suite-quickstart/lsq-keyboard-shortcuts.html
Plug 'vim-syntastic/syntastic'
Plug 'sjl/badwolf'
Plug 'jalvesaq/Nvim-R'
Plug 'mileszs/ack.vim'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-fugitive'
Plug 'jceb/vim-orgmode'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dkarter/bullets.vim'
Plug 'morhetz/gruvbox'
call plug#end()
" Plugin settings
let g:ctrlp_working_path_mode='c'  "ctrl p
set number
let NERDTreeShowLineNumbers=1 "nerdtree
" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]
set cursorline
let mapleader=","
" recommended settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" end recommended settings for syntastic
let g:vim_markdown_math = 1 "markdown math
" remapping
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>sa :source ~/Dropbox/KI/ModPro/Prakticum/SatSolver/SatSolver/satsession.vim<CR>
inoremap <leader><leader> <Esc>:w<CR>
nnoremap j gj
nnoremap k gk
noremap <leader>n :NERDTreeToggle<CR>
noremap <CR> o<Esc>
noremap <S-Enter> O<Esc>
" theme
colorscheme gruvbox
set background=dark
let NERDTreeQuitOnOpen=1
" tabs, folding
set tabstop=4
set shiftwidth=4
set expandtab
set foldmethod=indent
set foldlevel=20
set foldlevelstart=20
set sessionoptions+=folds
