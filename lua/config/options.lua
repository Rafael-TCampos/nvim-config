--- Garantir que o npm global esteja no PATH
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.expand("~/.npm-global/bin")
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options her
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.opt.guicursor = table.concat({
  "n-v-c:ver25-CursorNormal",
  "i:ver25-CursorInsert",
  "r-cr:ver25-CursorReplace",
}, ",")

vim.g.have_nerd_font = true
vim.opt.termguicolors = true
vim.opt.relativenumber = false
vim.opt.number = true

vim.cmd([[ set conceallevel=0
    set concealcursor=""

]])
