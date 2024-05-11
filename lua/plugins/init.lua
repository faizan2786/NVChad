-- define and return all the plugins to load
return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end
  },
  -- list nvim plugins to install using 'mason' package manager.
  -- this listed packages can be installed by
  -- running the command ':MasonInstallAll' in nvim
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "pyright",  -- an LSP for python
        "mypy",     -- a null-ls tool for python
        "ruff",     -- a null-ls tool for python
        "clangd",   -- an LSP for C++
      }
    }
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
  -- load the nvchad's lspconfig for lsp setup
  -- and our local 'lspconfig' defined in the 'configs' folder
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end
  },
  -- setup null-ls plugin for language tooling such as linters, formatters etc.
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"}, -- file types
    opts = function ()
      return require "configs.null-ls"  -- load the options from a custom 
                                        -- 'null-ls' config file
    end,
  },
}
