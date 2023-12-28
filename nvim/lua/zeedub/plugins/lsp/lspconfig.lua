return {
        "neovim/nvim-lspconfig",
        dependencies = {
                "williamboman/nvim-lsp-installer",
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
                local lspconfig = require("lspconfig")

                -- Individual server management
                -- gopls setup
                lspconfig.gopls.setup{
                        cmd = { "gopls" },
                        settings = {
                                gopls = {
                                        analyses = {
                                                unusedparams = true,
                                                shadow = false,
                                        },
                                        staticcheck = true,
                                        gofumpt = true,
                                },
                        },
                }

                -- pyright
                lspconfig.pyright.setup({})

                -- clangd
                lspconfig.clangd.setup({})

                -- rust-analyzer
                lspconfig.rust_analyzer.setup({
                        settings = {
                                ["rust-analyzer"] = {},
                        },
                })

                -- jdtls
                lspconfig.jdtls.setup({})

        end,

        
}
