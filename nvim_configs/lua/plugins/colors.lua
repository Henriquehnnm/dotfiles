-- em lua/plugins/colors.lua (ou outro arquivo dentro de lua/plugins)
return {
    {
        "brenoprata10/nvim-highlight-colors",
        lazy = true,
        event = { "BufReadPost", "BufNewFile" },
        config = function()
        vim.opt.termguicolors = true  -- garante suporte a cores
        require("nvim-highlight-colors").setup({
            render = "background",      -- pode mudar pra "foreground" ou "virtual"
            enable_rgb = true,
            enable_hex = true,
            enable_named = true,
            -- outras opções padrão...
        })
        end,
    },
}
