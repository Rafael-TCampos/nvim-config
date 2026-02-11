-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Auto-save ao sair do insert mode (HTML/CSS)
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = { "*.html", "*.css" },
  callback = function()
    vim.cmd("silent! write")
  end,
})

vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalFloat guibg=NONE
]])

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "CursorNormal", { fg = "#000000", bg = "#ffffff" })
    vim.api.nvim_set_hl(0, "CursorInsert", { fg = "#000000", bg = "#00ff00" })
    vim.api.nvim_set_hl(0, "CursorReplace", { fg = "#000000", bg = "#ff5555" })
  end,
})
