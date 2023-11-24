local M = {}

M.toggle = function()
    local options = {
        { name = "signcolumn",      type = "string" },
        { name = "number",          type = "boolean" },
        { name = "relativenumber",  type = "boolean" },
        { name = "cursorline",      type = "boolean" },
    }

    for _, option in ipairs(options) do
        local current_option_value = vim.o[option.name]

        if option.type == "string" then
            vim.o[option.name] = (current_option_value == "no") and "yes" or "no"
        elseif option.type == "boolean" then
            vim.o[option.name] = not current_option_value
        end
    end
end

return M
vim.api.nvim_command('command! serene lua require ("serene").toggle()')
-- TODO: stop lsp?
