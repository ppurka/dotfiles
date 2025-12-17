
-- Function to append modeline to file
vim.api.nvim_create_user_command(
    'AppendModeline',
    function ()
        local go = vim.api.nvim_get_option_value
        local et = go("expandtab") and " et" or ""
        local modeline = "vim: set" ..
                         " ts = "   .. go("tabstop", {})        ..
                         " sw = "   .. go("shiftwidth", {})     ..
                         " sts = "  .. go("softtabstop", {})    ..
                         " tw = "   .. go("textwidth", {})      ..
                         et         ..
                         " :"
        modeline = string.gsub(vim.o.commentstring, "%%s", modeline)
        vim.fn.append(vim.fn.line('$'), modeline)
    end,
    {}
)
