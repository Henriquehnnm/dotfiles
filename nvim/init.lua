-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("disable_treesitter_errors")

-- Adicione isso no seu init.lua:
vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = false,
  update_in_insert = false,
})

-- Silenciar TODAS as mensagens de erro:
local original_notify = vim.notify
vim.notify = function(msg, level, opts)
  if
    type(msg) == "string"
    and (
      msg:find("treesitter")
      or msg:find("decoration provider")
      or msg:find("nvim_buf_set_extmark")
      or msg:find("highlighter")
    )
  then
    return -- MATA A MENSAGEM
  end
  return original_notify(msg, level, opts)
end
