-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    },
    highlight = {
      enable = true,
      disable = function(lang, buf) return lang == "python" end,
    },
  },
}
