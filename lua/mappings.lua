require "nvchad.mappings"

-- vim key bindings
local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- override nvchad's navigation settings for tmux-vim-navigor to work in nvim
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>",   {desc = "window left"})
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>",  {desc = "window right"})
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>",   {desc = "window down"})
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>",     {desc = "window up"})
