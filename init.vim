call plug#begin('~/.local/share/nvim/plugged')
Plug 'rlue/vim-getting-things-down'
Plug 'nightsense/simplifysimplify'
Plug 'vim-latex/vim-latex'
Plug 'vim-syntastic/syntastic'
Plug 'iCyMind/NeoSolarized'
Plug 'sjl/badwolf'
Plug 'jalvesaq/Nvim-R'
call plug#end()
inoremap jj <Esc>
set number
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
nnoremap <leader><space> :nohlsearch<CR>
set foldmethod=indent
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>
set background=dark
nnoremap j gj
nnoremap k gk
