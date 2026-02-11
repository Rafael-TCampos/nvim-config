-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local live_server_running = false

--Atalho para o LiveServer
vim.keymap.set("n", "<leader>ls", function()
  if live_server_running then
    vim.cmd("LiveServerStop")
    live_server_running = false
  else
    vim.cmd("LiveServerStart")
    live_server_running = true
  end
end, { desc = "Toggle Live Server" })

--Atalho Code Runner
vim.keymap.set("n", "<leader>r", function()
  local file = vim.fn.expand("%")
  vim.cmd("split | terminal node " .. file)
end, { desc = "Run JS file" })
