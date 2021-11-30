local indent = 4

vim.cmd("filetype plugin indent on")

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
vim.o.splitright = true                            -- open splits on the right by default

vim.o.hidden = true  -- if true, buffers are merely hidden when closed; needed for toggleterm to work as intended

vim.o.signcolumn = "number"  -- display signs in the number column
vim.o.number = true  -- enable number column
vim.o.numberwidth = 2  -- number column fixed width
vim.o.cursorline = true  -- highlight line number of cursor (depending on CursorLineNr and CursorLine highlights)

vim.o.foldenable = false  -- get rid of folding, which I despise so much

vim.o.sessionoptions = "buffers,curdir,localoptions,options,resize,tabpages,terminal,winsize"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- saner text wrapping for latex and markdown
vim.cmd("autocmd bufreadpre *.tex setlocal textwidth=90")
vim.cmd("autocmd bufreadpre *..md setlocal textwidth=90")
vim.cmd("autocmd BufRead,BufNewFile *.tex set conceallevel=1")

-- latex to unicode
vim.g.latex_to_unicode_auto = 1
vim.g.latex_to_unicode_tab = 1
vim.g.latex_to_unicode_file_types = {"julia", "rust", "python"}

-- default to latex rather than plaintex
vim.g.tex_flavor = "latex"

-- an old and crazy hack for finding the highlight group under the cursor, now bound to F10 in all modes
vim.cmd([[map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>]])
