return function()
  require "telescope".setup {
    defaults = {
      file_ignore_patterns = { "Cargo.lock" },
    },
  }
  local dotconfig = os.getenv("HOME") .. "/dotfiles/dot-config"
  local builtin = require "telescope.builtin"
  vim.keymap.set("n", "<leader>ff", builtin.find_files)
  vim.keymap.set("n", "<leader>fg", builtin.live_grep)
  vim.keymap.set("n", "<leader>fh", builtin.help_tags)
  vim.keymap.set("n", "<leader>fb", builtin.buffers)
  vim.keymap.set("n", "<leader>fr", builtin.resume)
  vim.keymap.set("n", "<leader>fa",
    function()
      ---@diagnostic disable-next-line: param-type-mismatch
      builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy") }
    end,
    { desc = "Find file in nvim packages", }
  )
  vim.keymap.set("n", "<leader>fc", function()
      builtin.find_files {
        cwd = dotconfig,
        file_ignore_patterns = "^nvim/",
      }
    end,
    { desc = "Find file in dotconfig", }
  )
  vim.keymap.set("n", "<leader>fn",
    function()
      builtin.find_files { cwd = dotconfig .. "/nvim" }
    end,
    { desc = "File file in nvim config", })
end
