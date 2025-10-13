-- Este arquivo configura o autocompletar para várias linguagens usando o LSP (Language Server Protocol).
-- LazyVim já vem com `nvim-cmp` e `mason` configurados, então só precisamos
-- indicar quais servidores de linguagem queremos ativar.

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Python
        pyright = {},

        -- JavaScript e TypeScript
        tsserver = {},

        -- Astro
        astro = {},

        -- PHP
        intelephense = {},

        -- Shell Script
        bashls = {},

        -- HTML
        html = {},

        -- CSS
        cssls = {},
      },
    },
  },
}
