-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Vite server keymaps
vim.keymap.set("n", "<leader>s", ":ViteServerStart<CR>", { desc = "Vite Server Start" })
vim.keymap.set("n", "<leader>x", ":ViteServerStop<CR>", { desc = "Vite Server Stop" })
