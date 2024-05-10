return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end
  },
  -- Setup Syntax highlighters for specific languages using tree-sitter
  -- (i.e. this is equivalent of running `:TSInstall <language_name>`
  --        command in nvim`)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "python", "cpp", "make",
        "dockerfile", "query"
      }
    }
  },
  -- install nvim plugins using nvChad's mason package managers
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "pyright" -- an LSP for python
      }
    }
  },
  -- configure the python LSP to use it in python files
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end
  },
}
