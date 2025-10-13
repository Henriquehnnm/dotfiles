return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        tsserver = {},
        intelephense = {},
        bashls = {},
        html = {},
        cssls = {},
        astro = {},
      },
    },
    config = function(_, opts)
      for server, config in pairs(opts.servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable({ server })
      end
    end,
  },
}

