require("mason-lsp.common")

Mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },

    pip =  {
        -- upgrade_pip 不设置为true的话，安装clang-format会失败
        upgrade_pip = true,
        install_args = {"-i","https://pypi.tuna.tsinghua.edu.cn/simple/" }
    },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
MasonConfig.setup({
    -- ensure_installed = {"bashls", "clangd", "cmake", "jsonls", "lua_ls", "pyright", "yamlls",},
    ensure_installed = {"lua_ls", "clangd"}
})


-- require("mason-lsp.config.lua_ls").on_setup({})
MasonConfig.setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        Lspconfig[server_name].setup {}
    end,

    -- override a specific handler
    ["lua_ls"] = require("mason-lsp.config.lua_ls").setup,
    ["clangd"] = require("mason-lsp.config.clangd").setup,
})

