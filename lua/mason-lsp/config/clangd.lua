require("mason-lsp.common")

return {
    setup = function()
        Lspconfig.clangd.setup{
            cmd = {"clangd"},
            on_attach = LspOnAttach
        }
    end,
}
