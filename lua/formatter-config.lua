vim.cmd([[nnoremap <silent> <leader>f :Format<CR>]])

require('formatter').setup({
  filetype = {
    typescript = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
    typescriptreact = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
    javascript = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
    javascriptreact = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
    json = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
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
