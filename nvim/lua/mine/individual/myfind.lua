local M = {}

M.myfind_files = function()
  --local opts =  -- define here if you want to define something
  local ok = pcall(require"telescope.builtin".git_files, {theme = "dropdown"})
  if not ok then require"telescope.builtin".find_files({theme = "dropdown", no_ignore = true}) end
end

return M
