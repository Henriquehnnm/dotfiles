return {
  -- nvim-cmp com configurações otimizadas para web dev
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      })

      -- Configurações específicas para diferentes tipos de arquivo
      opts.completion = {
        completeopt = "menu,menuone,noinsert",
      }

      return opts
    end,
  },

  -- Suporte melhor para snippets
  {
    "L3MON4D3/LuaSnip",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
      update_events = { "TextChanged", "TextChangedI" },
    },
    config = function(_, opts)
      require("luasnip").setup(opts)

      -- Carregar snippets específicos para web
      require("luasnip/loaders/from_vscode").lazy_load()
      require("luasnip/loaders/from_vscode").lazy_load({
        paths = { "./snippets" }, -- se tiver snippets personalizados
      })
    end,
  },
}
