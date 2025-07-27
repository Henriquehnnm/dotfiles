-- ~/.config/nvim/lua/plugins/vite-server.lua
return {
    "liaohui5/vite-server.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
    require("vite-server").setup({
        vite_cli_opts = {
            port = 3000,
            open = true,
            force = true,
                cors = false,
                strictPort = true,
                base = "/",
        },
        show_cmd = false,  -- não mostra comando
        deatch_process_on_exit = false,
        hooks = {
            on_exit = function(_, exit_code)
            -- Silencia todas as mensagens de exit
            end,
            on_stderr = function(_, data)
            -- Silencia todas as mensagens de erro
            end,
        },
    })
    end,
}
