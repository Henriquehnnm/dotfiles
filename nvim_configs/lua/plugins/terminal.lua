return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
    require("toggleterm").setup({
        -- opções comuns:
        size = 20,
        open_mapping = [[<c-\>]], -- atalho padrão para abrir/fechar terminal
        direction = "horizontal", -- opções: "vertical" | "horizontal" | "tab" | "float"
        shade_terminals = true,
        start_in_insert = true,
        persist_size = true,
        close_on_exit = true,
    })
    end,
}
