-- ~/.config/nvim/lua/plugins/lualine.lua
return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
    -- Função para mostrar status do Vite Server
    local function vite_server_status()
    local ok, vs = pcall(require, "vite-server")
    if not ok then
        return ""
        end

        if vs.is_started then
            local url = vs.gen_url(vs.config.vite_cli_opts)
            return "󱐋 " .. url
            else
                return ""
                end
                end

                -- Função para mostrar informações detalhadas do Git (branch, diffs, status)
                local function git_detailed_status()
                local gitsigns = vim.b.gitsigns_status_dict
                if not gitsigns then
                    return ""
                    end

                    local branch = gitsigns.head or ""
                    local added = gitsigns.added or 0
                    local changed = gitsigns.changed or 0
                    local removed = gitsigns.removed or 0

                    local status = ""
                    if branch ~= "" then
                        status = " " .. branch
                        end
                        if added ~= 0 then
                            status = status .. "  " .. tostring(added)
                            end
                            if changed ~= 0 then
                                status = status .. "  " .. tostring(changed)
                                end
                                if removed ~= 0 then
                                    status = status .. "  " .. tostring(removed)
                                    end

                                    return status
                                    end

                                    -- Adiciona o status do Vite e infos de git na seção lualine_x
                                    opts.sections = opts.sections or {}
                                    opts.sections.lualine_x = opts.sections.lualine_x or {}

                                    -- Insere o vite_server_status no início da seção lualine_x com cores
                                    table.insert(opts.sections.lualine_x, 1, {
                                        vite_server_status,
                                        color = { fg = "#a6e3a1", gui = "bold" }, -- verde claro do rose pine
                                        separator = { left = "", right = "" }
                                    })

                                    -- Adiciona infos de git com cor
                                    table.insert(opts.sections.lualine_x, 2, {
                                        git_detailed_status,
                                        color = { fg = "#fab387", gui = "bold" }, -- cor laranja suave
                                        separator = { left = " ", right = "" }
                                    })

                                    return opts
                                    end,
}
