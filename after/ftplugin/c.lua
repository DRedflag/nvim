local function handler()
        if vim.api.nvim_get_current_line():sub(2,2) == "*" then
                local topchar = vim.api.nvim_get_current_line():sub(1,1)                
                if topchar == "/" then return "<CR><CR><Space><up><Space>*"
                elseif topchar == " " then return "<CR>*" 
                end
        end
        return "<CR>"
end

vim.keymap.set("i", "*", function()
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        if col == 0 then return "*" end
        local char = vim.api.nvim_get_current_line():sub(col,col)
        print(char)
        if char == "/" then
                return "**/<left><left>"
        else
                return "*"
        end 
end, {noremap = true, expr = true})

vim.keymap.set("i", "<CR>", function()
        return handler()
end, {noremap = true, expr = true})
