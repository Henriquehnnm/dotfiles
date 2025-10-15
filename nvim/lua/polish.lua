-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.keymap.set("n", "<leader>gg", function()
  local term = require("toggleterm.terminal").Terminal:new({
    cmd = "gemini",
    direction = "float",
    float_opts = {
      border = "curved",
    },
  })
  term:toggle()
end, {
  noremap = true,
  silent = true,
  desc = "Toggle Gemini terminal",
})