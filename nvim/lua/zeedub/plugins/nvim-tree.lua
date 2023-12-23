-- nvim-tree turn on diagnostics so that we receive helpful
-- symbols in the tree for a directory
return {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
                local nvimtree = require("nvim-tree")

                nvimtree.setup({
                        diagnostics = {
                                enable = true,
                                icons = {
                                        hint = "",
                                        info = "",
                                        warning = "",
                                        error = "",
                                },
                                show_on_dirs = true,
                        },
                       view = { signcolumn = 'yes' },
                })
        end,
}
