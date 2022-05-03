local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local action_layout = require "telescope.actions.layout"

telescope.setup {
    defaults = {
        mappings = {
            -- C-q is quickfix list, like copen
            i = {
                ["<C-p>"] = action_layout.toggle_preview,
                ["<C-t>"] = actions.select_tab,
                ["<C-v>"] = actions.select_vertical,
                ["<C-x>"] = actions.select_horizontal,
            },
            n = {
                ["p"] = action_layout.toggle_preview,
                ["s"] = actions.select_horizontal,
                ["t"] = actions.select_tab,
                ["v"] = actions.select_vertical,
                ["x"] = actions.select_horizontal,
            },
        },
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--no-ignore',
            '--glob=!cscope.*',
            '--glob=!tags',
            '--glob=!.git/*',
        },
    },
}
