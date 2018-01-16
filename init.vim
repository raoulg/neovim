call plug#begin('~/.local/share/nvim/plugged')
Plug 'rlue/vim-getting-things-down'
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
call plug#end()
let g:ctrlp_working_path_mode='c'
set number
let NERDTreeShowLineNumbers=1
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
" remapping
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>sa :source ~/Dropbox/KI/ModPro/Prakticum/SatSolver/SatSolver/satsession.vim<CR>
nnoremap j gj
nnoremap k gk
noremap <leader>n :NERDTreeToggle<CR>
" theme
set background=dark
colorscheme badwolf
let NERDTreeQuitOnOpen=1
" tabs, folding
set tabstop=4
set shiftwidth=4
set expandtab
set foldmethod=indent
set foldlevelstart=20
