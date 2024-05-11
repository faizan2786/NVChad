-- 'init.lua' -> this is THE config file nvim looks at when it starts
-- Any location/file from the top level 'lua' directory can be directly
-- accessed in this file using 'folder_name.file_name' syntax

vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- load lazy plugin when the first time nvim starts
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system {
    "git", "clone", "--filter=blob:none",
    repo, "--branch=stable", lazypath
  }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy" -- import lazy.lua from 
                                           -- configs folder

-- load plugins
require("lazy").setup(
  { -- setup NvChad's own plugins, by pulling from its official repo
    {
      "NvChad/NvChad", -- nvchad's master repo
      lazy = false,
      branch = "v2.5", -- branch version
      import = "nvchad.plugins", -- import plugins file from 'lua/nvchad' dir
      config = function()
        require "options"
      end,
    },
    { import = "plugins" }, -- import all plugins from the local plugins folder
  },
  lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
