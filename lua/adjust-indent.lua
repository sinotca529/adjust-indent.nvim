local set_config = function(user_conf)
    local default = {
        max_sw = 8, -- max shift width
    }

    user_conf = user_conf or {}
    return vim.tbl_deep_extend('force', default, user_conf)
end

local main = function(user_conf)
    local conf = set_config(user_conf)

    -- CASE : Indent is space(s).
    local line_num = vim.fn.search(string.format(
        '^ \\{1, %q}',
        conf.max_sw
    ))
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

local setup = function(user_conf)
    vim.api.nvim_create_augroup('adjust-indent', {})
    vim.api.nvim_create_autocmd('BufRead', {
        group = 'adjust-indent',
        callback = function()
            main(user_conf)
        end
    })
end

return {
    setup = setup
}

