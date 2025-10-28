return {
  "neanias/everforest",
  name = "everforest",
  lazy = false,
  priority = 1000,
  config = function()
    -- Ativa o tema Everforest
    vim.cmd("colorscheme everforest")

    -- Habilita o destaque da linha do cursor
    vim.opt.cursorline = true

    -- Remove o fundo do destaque da linha, mantendo só o gutter
    vim.cmd("highlight CursorLine guibg=NONE")
  end,
}

