-- import nvChad's lspconfig plugin to configure lsp's.
local nvchadconfig = require("nvchad.configs.lspconfig")

local on_attach = nvchadconfig.on_attach
local on_init = nvchadconfig.on_init
local capabilities = nvchadconfig.capabilities

local lspconfig = require "lspconfig" -- define local variable for
                                      -- the current config file
-- List of LSPs to configure
local servers = { "pyright", "clangd", "html", "cssls" }

-- define filetypes for each server
local filetypes = {
  pyright = "python",
  clangd = "cpp",
  html = "html",
  cssls = "css",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    filetypes = { filetypes[lsp] }
  }
end
