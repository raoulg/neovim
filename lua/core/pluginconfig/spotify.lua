-- this requires to give the install script in
-- $HOME/.local/share/nvim/site/pack/packer/start/neovim-spotify
-- to be executable with chmod +x install.sh
--
-- After that, you can run ./install.sh
--


WhichKey.register({
    m = {
        name = "Control spotify music",
        p = {"<cmd>SpotifyPlay<CR>", "Play"},
        j = {"<cmd>SpotifyNext<CR>", "Next"},
        k = {"<cmd>SpotifyPrevious<CR>", "Previous"},
        s = {"<cmd>SpotifyPause<CR>", "Stop"},
        n = {"<cmd>SpotifyCurrentSong<CR>", "echo Now playing"},
    }


}, {prefix="<leader>"})


