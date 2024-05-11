local null_ls = require('null-ls') -- import the null-ls plugin

-- configure the null_ls sources (i.e built-in tools)
local opts = {
  sources = {
    null_ls.builtins.diagnostics.mypy, -- load null-ls' diagnostics tool 'mypy'
    null_ls.builtins.diagnostics.ruff, -- and 'ruff' for static type checking 
  }                                    -- and linting respectively.
}
return opts
