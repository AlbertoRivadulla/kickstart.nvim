-- Enable word wrap locally
vim.opt_local.wrap = true

-- Automatically fetch the title from an URL, and paste them in Markdown format
local function fetch_title(url)
    -- Extract the title from the response to curl on the URL
    local handle = io.popen("curl -sL " .. vim.fn.shellescape(vim.trim(url)) .. "| sed -n \'s:.*<title>\\(.*\\)</title>.*:\\1:p\'")
    if not handle then
        return nil
    end

    local result = handle:read("*a")
    handle:close()

    result = result:gsub("%s+", " ")  -- collapse whitespace
    result = vim.trim(result)
    if result == "" then
        return nil
    end
    return result
end

vim.api.nvim_create_user_command("PasteMarkdownLink", function()
    -- Get the URL from the clipboard
    local url = vim.trim(vim.fn.getreg("+"))
    if url == nil or url == "" then
        print("No URL found in the clipboard")
        return
    end

    local title = fetch_title(url)
    if not title then
        print("Could not get the title from the URL")
        title = "link"
    end

    local markdown_link = string.format("[%s](%s)", title, url)
    -- Paste the line `markdown_link`, characterwise, after the cursor, and place the cursor after the text
    vim.api.nvim_put({markdown_link}, 'c', true, true)

    end, { nargs = 0 }
)
vim.keymap.set("n", "<leader>pl", ":PasteMarkdownLink<CR>",
    { buffer = true, desc = "Paste a URL with its title in Markdown format" }
)
