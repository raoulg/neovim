return {
  {"ellisonleao/gruvbox.nvim"},
  {'folke/tokyonight.nvim'},
  { "catppuccin/nvim", as = "catppuccin" },
  {'navarasu/onedark.nvim'},
  {'gbprod/nord.nvim'},
  {'Abstract-IDE/Abstract-cs'},
  {"EdenEast/nightfox.nvim"},
  {
    'andrew-george/telescope-themes',
    config = function()
        require('telescope').load_extension('themes')
    end
  },
}