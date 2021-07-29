local indent = 4

vim.cmd("filetype plugin indent on")

-- set this to true to disable all LSP related crap
ENABLE_LSP = true

vim.o.clipboard = "unnamedplus"                    -- have vim use OS clipboard
vim.o.completeopt = "menuone,noinsert,noselect"    -- autocomplete options
vim.o.expandtab = true                             -- expand tabs into spaces
vim.o.autoindent = true
vim.o.smarttab = true
vim.o.termguicolors = true                         -- enable true color
vim.o.tabstop = indent
vim.o.shiftwidth = indent
vim.o.wildmode = "list:longest"                    -- command-line completion mode
vim.o.pumheight = 12                               -- maximum autocomplete popup height
vim.o.shortmess = vim.o.shortmess.."c"
vim.o.timeoutlen = 500                             -- note that this controls which-key.nvim
vim.o.textwidth = 100

vim.o.hidden = true  -- if true, buffers are merely hidden when closed; needed for toggleterm to work as intended

vim.o.signcolumn = "number"  -- display signs in the number column
vim.o.number = true  -- enable number column  TODO: not sure how happy I am about this yet
vim.o.numberwidth = 2  -- number column fixed width
vim.o.cursorline = true  -- highlight line number of cursor (depending on CursorLineNr and CursorLine highlights)

vim.o.foldenable = false  -- get rid of folding, which I despise so much

--vim.api.nvim_del_keymap("", "`")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- doing these in lua was ugly and causing problems, need to wait until there's a proper API for it
vim.cmd("inoremap <expr> <tab> pumvisible() ? \"\\<C-n>\" : \"\\<tab>\"")
vim.cmd("inoremap <expr> <S-tab> pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\"")

-- saner text wrapping for latex and markdown
vim.cmd("autocmd bufreadpre *.tex setlocal textwidth=90")
vim.cmd("autocmd bufreadpre *..md setlocal textwidth=90")
vim.cmd("autocmd BufRead,BufNewFile *.tex set conceallevel=1")

-- latex to unicode
vim.g.latex_to_unicode_auto = 1
vim.g.latex_to_unicode_tab = 1

-- an old and crazy hack for finding the highlight group under the cursor, now bound to F10 in all modes
vim.cmd([[map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>]])
