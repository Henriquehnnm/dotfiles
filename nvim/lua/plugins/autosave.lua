-- plugins/autosave.lua
return {
  "pocco81/auto-save.nvim",  -- ou "okuuva/auto-save.nvim"
  opts = {
    enabled = true,         -- ativa por padrão
    trigger_events = {      -- eventos que disparam o salvamento
      "InsertLeave",
      "TextChanged",
    },
    debounce_delay = 1000,  -- tempo de espera antes de salvar (1 segundo)
    execution_message = {
      message = function()
        return " AutoSave: salvo às " .. vim.fn.strftime("%H:%M:%S")
      end,
      dim = 0.2,
      cleaning_interval = 1250,
    },
  }
}

