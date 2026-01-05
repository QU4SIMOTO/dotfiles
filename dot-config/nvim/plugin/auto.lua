-- highlight yanked text
vim.api.nvim_create_autocmd(
  "TextYankPost",
  {
    pattern = "*",
    callback = function()
      vim.highlight.on_yank({ timeout = 500 })
    end,
  }
)

-- jump to last edit position on opening file
vim.api.nvim_create_autocmd(
  "BufReadPost",
  {
    pattern = "*",
    callback = function(_ev)
      if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
        -- except for in git commit messages
        -- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
        if not vim.fn.expand("%:p"):find(".git", 1, true) then
          vim.cmd('exe "normal! g\'\\""')
        end
      end
    end
  }
)

-- leave paste mode when leaving insert mode (if it was on)
vim.api.nvim_create_autocmd(
  "InsertLeave",
  { pattern = "*", command = 'set nopaste', }
)

-- for psql temp files, set filetype to sql
vim.api.nvim_create_autocmd("BufRead", {
  pattern = "/tmp/psql.edit*",
  callback = function()
    vim.bo.filetype = "sql"
  end,
})
