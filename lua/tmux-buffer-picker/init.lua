local M = {}

---Setup the tmux-buffer-picker plugin
---@param opts UserOptions: plugin options
M.setup = function(opts)
  require("tmux-buffer-picker.config").setup(opts)
end

---Say hello to the user
---@return string: message to the user
M.hello = function()
  local str = "Hello " .. require("tmux-buffer-picker.config").options.name
  vim.print(str)
  return str
end

---Say bye to the user
---@return string: message to the user
M.bye = function()
  local str = "Bye " .. require("tmux-buffer-picker.config").options.name
  vim.print(str)
  return str
end

return M
