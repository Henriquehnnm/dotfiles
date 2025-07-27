-- ~/.config/nvim/lua/disable_treesitter_errors.lua

-- Sobrescreve vim.notify para filtrar erros de extmark
vim.notify_orig = vim.notify
vim.notify = function(msg, level, opts)
  if type(msg) == "string" and msg:match("nvim_buf_set_extmark") then
    return
  end
  return vim.notify_orig(msg, level, opts)
end

-- Configuração do Tree-sitter: ativado normalmente, mas sem notificação
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
  -- opcional: desabilita highlight em buffers específicos
  -- disable = { "markdown", "latex" },
})
