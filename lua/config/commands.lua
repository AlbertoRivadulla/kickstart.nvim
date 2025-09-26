-- Create or open a daily note in the directory specified in the project's configuration file
vim.api.nvim_create_user_command("Today", function()
    local config_file = "./.nvim_config"

    if vim.fn.filereadable(config_file) == 0 then
        vim.notify("Missing configuration file: " .. config_file, vim.log.levels.ERROR)
        return
    end

    -- Parse the configuration file
    local daily_notes_dir = nil
    for _, line in ipairs(vim.fn.readfile(config_file)) do
        -- local key, value = line:match("^\s*([\w_]+)\s*=\s*(.+)\s*$")
        local key, value = line:match("^%s*([%w_]+)%s*=%s*(.+)%s*$")
        if key == "daily_notes_dir" and value then
            daily_notes_dir = value
            break
        end
    end

    if not daily_notes_dir then
        vim.notify("'daily_notes_dir' entry not found in " .. config_file, vim.log.levels.ERROR)
        return
    end

    local today_str = os.date("%Y-%m-%d")
    local year_month_str = os.date("%Y-%m-%b")
    local week_str = "week-" .. os.date("%V")

    local subdir = string.format("%s/%s/%s", daily_notes_dir, year_month_str, week_str)
    local file_path = string.format("%s/%s.md", subdir, today_str)

    -- Create the subdir if needed
    vim.fn.mkdir(subdir, "p")
    -- Create or open the file
    vim.cmd.edit(file_path)

end, { desc = "Open a daily note" })
