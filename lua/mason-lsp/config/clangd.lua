require("mason-lsp.common")

--[[
local default_capabilities = {
    textDocument = {
        completion = {
            editsNearCursor = true,
        },
    },
    offsetEncoding = { 'utf-8', 'utf-16' },
}
]]--

return {
    setup = function()
        Lspconfig.clangd.setup{
            cmd = {"clangd"},
            on_attach = LspOnAttach,
            capabilities = LspCapabilities,
        }
    end,
}
