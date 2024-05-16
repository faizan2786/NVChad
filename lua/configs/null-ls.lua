local null_ls = require "null-ls" -- import the null-ls plugin

-- configure the null_ls sources (i.e built-in tools)
local opts = {

  -- list null-ls sources(i.e. language tools) to use
  sources = {
    null_ls.builtins.formatting.clang_format, -- c++ formatting tool
    null_ls.builtins.formatting.black, -- python formatting tool
    null_ls.builtins.diagnostics.mypy, -- load null-ls' diagnostics tools
    null_ls.builtins.diagnostics.ruff, -- 'mypy' and 'ruff' for static type
    -- checking and linting respectively.
  },
}
return opts
