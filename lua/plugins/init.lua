-- define and return all the plugins to load
return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end
  },
  -- setup Syntax highlighters for specific languages using tree-sitter
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
  -- list nvim plugins to install using mason package manager.
  -- this can be done by running command ':MasonInstallAll' in nvim
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "pyright" -- an LSP for python
      }
    }
  },
  -- load the nvchad's lspconfig for lsp setup
  -- and our local 'lspconfig' defined in the 'configs' folder
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end
  },
}
