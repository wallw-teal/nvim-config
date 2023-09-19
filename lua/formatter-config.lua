vim.cmd([[nnoremap <silent> <leader>f :Format<CR>]])

require('formatter').setup({
  filetype = {
    typescript = {
      function()
        return {
          exe = "npx",
          args = {"prettier", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
    typescriptreact = {
      function()
        return {
          exe = "npx",
          args = {"prettier", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
    javascript = {
      function()
        return {
          exe = "npx",
          args = {"prettier", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
    javascriptreact = {
      function()
        return {
          exe = "npx",
          args = {"prettier", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
    json = {
      function()
        return {
          exe = "npx",
          args = {"prettier", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    }
  }
})

-- Assign formatting shortcuts for formatting (aka "pretty")
vim.api.nvim_set_keymap('n', '<leader>p', ':Format<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>P', ':FormatWrite<CR>', { noremap = true })

-- Auto format on save
vim.cmd [[
  augroup FormatAutoGroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]]
