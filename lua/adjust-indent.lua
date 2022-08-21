local setup = function()
    vim.api.nvim_create_augroup('adjust-indent', {})
    vim.api.nvim_create_autocmd('BufRead', {
        group = 'adjust-indent',
        callback = function()
            -- CASE : Indent is space(s).
            local line_num = vim.fn.search([[^ \+]])
            if line_num ~= 0 then
                local line = vim.fn.getline(line_num)
                local _, e = string.find(line, [[^ +]])
                vim.opt_local.expandtab = true;
                vim.opt_local.shiftwidth = e;
                return
            end

            -- CASE : Indent is tab.
            local tab_line_num = vim.fn.search([[^\t\+]])
            if tab_line_num ~= 0 then
                vim.opt_local.expandtab = false;
                return
            end
        end
    })
end

return {
    setup = setup
}

