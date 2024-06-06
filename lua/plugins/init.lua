-- define and return all the plugins to load
return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  -- list nvim plugins to install using 'mason' package manager.
  -- this listed packages can be installed by
  -- running the command ':MasonInstallAll' in nvim
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua", -- LSP and formatter for Lua
        "html-lsp",
        "css-lsp",
        "prettier", -- LSP and formatter for html,css
        "pyright", -- a lightweight LSP for python
        "mypy", -- a null-ls tool for python static type checking
        "ruff", -- a null-ls tool for python linting
        "black", -- an auto-formating tool for pyhton
        "clangd", -- a powerful LSP for C++
        -- (includes linting, static analysis, etc.)
        "clang-format", -- a c++ formatter
        "gopls", -- an LSP for GO
      },
    },
  },
  -- setup Syntax highlighters for specific languages using tree-sitter
  -- (i.e. this is equivalent of running `:TSInstall <language_name>`
  --        command in nvim`)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "python",
        "cpp",
        "make",
        "dockerfile",
        "markdown",
        "markdown_inline",
        "html",
        "css",
        "go",
      },
    },
  },
  -- load the nvchad's lspconfig and
  -- our local 'lspconfig' defined in the 'configs' folder
  -- (for various LSP setup)
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- setup null-ls plugin for language tooling such as linters, formatters etc.
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      return require "configs.null-ls" -- load the options from a custom
      -- 'null-ls' config file
    end,
  },
  -- setup vim tmux navigator plugin
  -- (for seamlessly navigate between vim and tmux panes)
  {
    "christoomey/vim-tmux-navigator",
    lazy = false, -- always load this plugin
  },
}
