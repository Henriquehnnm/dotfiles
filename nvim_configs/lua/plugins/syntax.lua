return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- Silencia TODOS os erros e avisos do treesitter
    local original_notify = vim.notify
    local treesitter_errors = {
      "treesitter",
      "tree-sitter",
      "Tree-sitter",
      "nvim-treesitter",
      "highlighter",
      "decoration provider",
      "nvim_buf_set_extmark",
      "Error executing lua",
      "parser",
      "TSUpdate",
    }

    -- Override vim.notify para filtrar mensagens do treesitter
    vim.notify = function(msg, level, opts)
      if type(msg) == "string" then
        for _, pattern in ipairs(treesitter_errors) do
          if string.find(msg:lower(), pattern:lower()) then
            return -- Silencia mensagem
          end
        end
      end
      return original_notify(msg, level, opts)
    end

    -- Configuração ultra-protegida
    local ok, treesitter = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return -- Falha silenciosa
    end

    -- Setup com máximo de proteção contra erros
    local setup_ok = pcall(function()
      treesitter.setup({
        ensure_installed = {}, -- Vazio para evitar downloads
        auto_install = false,
        sync_install = false,

        highlight = {
          enable = true,
          -- Desabilita linguagens problemáticas
          disable = { "lua", "vim", "vimdoc" },
          additional_vim_regex_highlighting = false,

          -- Função de disable com proteção extra
          disable = function(lang, buf)
            -- Lista de linguagens sempre desabilitadas
            local always_disable = { "lua", "vim", "vimdoc" }
            for _, disabled_lang in ipairs(always_disable) do
              if lang == disabled_lang then
                return true
              end
            end

            -- Desabilita para arquivos grandes
            local max_filesize = 30 * 1024 -- 30KB
            local buf_name = vim.api.nvim_buf_get_name(buf or 0)
            if buf_name and buf_name ~= "" then
              local ok_stat, stats = pcall(vim.loop.fs_stat, buf_name)
              if ok_stat and stats and stats.size > max_filesize then
                return true
              end
            end

            return false
          end,
        },

        -- Desabilita todas as outras funcionalidades
        indent = { enable = false },
        incremental_selection = { enable = false },
        textobjects = { enable = false },
        playground = { enable = false },
        query_linter = { enable = false },
        refactor = { enable = false },
        rainbow = { enable = false },
        context_commentstring = { enable = false },
        autopairs = { enable = false },
      })
    end)

    -- Se o setup falhar, desabilita o highlight completamente
    if not setup_ok then
      vim.cmd([[
        autocmd BufEnter * if &filetype != '' | setlocal syntax=on | endif
      ]])
    end

    -- Proteção adicional: intercepta erros do treesitter
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      callback = function(args)
        local buf = args.buf
        pcall(function()
          -- Tenta desabilitar treesitter se houver problemas
          local has_ts = pcall(vim.treesitter.get_parser, buf)
          if not has_ts then
            vim.bo[buf].syntax = "on"
          end
        end)
      end,
    })

    -- Desabilita diagnósticos relacionados ao treesitter
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          -- Filtra diagnósticos do treesitter
          if diagnostic.source and string.find(diagnostic.source:lower(), "treesitter") then
            return ""
          end
          return diagnostic.message
        end,
      },
    })
  end,
}
