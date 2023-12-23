prettier = {
    function()
        return {
            exe = "npx",
            args = {
                "prettier",
                "--stdin-filepath",
                vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
            },
            stdin = true
        }
    end
}

require('formatter').setup({
    filetype = {
        typescript = prettier,
        typescriptreact = prettier,
        javascript = prettier,
        javascriptreact = prettier,
        json = prettier,
    }
})

-- Auto format on save
vim.cmd [[
    augroup FormatAutoGroup
        autocmd!
        autocmd BufWritePost * FormatWrite
    augroup END
]]
