-- import nvChad's lspconfig plugin to configure lsp's.
local nvchadconfig = require("nvchad.configs.lspconfig")

local on_attach = nvchadconfig.on_attach
local on_init = nvchadconfig.on_init
local capabilities = nvchadconfig.capabilities

local lspconfig = require "lspconfig" -- import lspconfig.lua file 
                                      -- (from same directory)

local servers = { "pyright" } -- List of LSPs to configure

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    filetypes = {"python"}
  }
end
