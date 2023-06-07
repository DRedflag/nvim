local M={}
local api = vim.api


M.generic_print = function()
        print("hello")
end

M.generic_get_line = function()
        local current_row, current_col = unpack(api.nvim_win_get_cursor(0))
        print (current_row, current_col)
        print(api.nvim_buf_get_lines(0, current_row-1, current_row, false)[1])
end

return M
