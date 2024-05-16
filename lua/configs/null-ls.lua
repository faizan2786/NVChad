local null_ls = require('null-ls') -- import the null-ls plugin

-- defina a group for configuring auto-format on SAVE
local auto_group = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure the null_ls sources (i.e built-in tools)
local opts = {

  -- list null-ls sources(i.e. language tools) to use
  sources = {
    null_ls.builtins.formatting.clang_format, -- c++ formatting tool
    null_ls.builtins.formatting.black,    -- python formatting tool
    null_ls.builtins.diagnostics.mypy,    -- load null-ls' diagnostics tools
    null_ls.builtins.diagnostics.ruff,    -- 'mypy' and 'ruff' for static type
                                          -- checking and linting respectively.
    null_ls.builtins.formatting.prettier, -- formatting tool for html, css, js
  },

  -- configure auto-format on save
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- clear any exisiting auto commands
      vim.api.nvim_clear_autocmds({
        group = auto_group,
        buffer = bufnr,
      })

      -- create our custom auto command for the event that triggers
      -- just before writing buffers (i.e. before saving writes to files)
      vim.api.nvim_create_autocmd("BufWritePre",
        {
          group = auto_group,
          buffer = bufnr,
          -- define callback for the event
          callback = function ()
            vim.lsp.buf.format({ bufnr = bufnr }) -- call lsp's buffer format 
                                                  -- command
          end
        })
    end
  end
}
return opts
