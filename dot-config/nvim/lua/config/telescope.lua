return function()
  local telescope = require "telescope"
  local actions = require "telescope.actions"

  telescope.setup {
    defaults = {
      file_ignore_patterns = { "Cargo.lock", "package-lock.json", "node_modules", ".git/" },
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<Esc>"] = actions.close,
        },
      },
      layout_config = {
        horizontal = {
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      path_display = { "truncate" },
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
    },
    pickers = {
      find_files = {
        hidden = true,
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
      live_grep = {
        additional_args = function()
          return { "--hidden" }
        end,
      },
      buffers = {
        sort_lastused = true,
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
        },
      },
    },
  }
  local dotconfig = os.getenv("HOME") .. "/dotfiles"
  local builtin = require "telescope.builtin"
  vim.keymap.set("n", "<leader>ff", builtin.find_files,
    { desc = "Find files excluding hidden and git ignored" }
  )
  vim.keymap.set("n", "<leader>fF", function()
    builtin.live_grep({
      no_ignore = true,
      hidden = true,
      no_ignore_parent = true,
    })
  end, { desc = "Find files including hidden and git ignored" })
  vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep", })
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags", })
  vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers", })
  vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume last search", })
  vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
  vim.keymap.set("n", "<leader>fS", builtin.lsp_dynamic_workspace_symbols, { desc = "Workspace symbols" })
  vim.keymap.set("n", "<leader>fp",
    function()
      ---@diagnostic disable-next-line: param-type-mismatch
      builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy") }
    end,
    { desc = "Find file in nvim packages", }
  )
  vim.keymap.set("n", "<leader>fc", function()
      builtin.find_files {
        cwd = dotconfig,
        file_ignore_patterns = { "**/nvim", ".git" },
        no_ignore = false,
        hidden = true,
      }
    end,
    { desc = "Find file in dotconfig (excluding nvim which is on a different map)", }
  )
  vim.keymap.set("n", "<leader>fn",
    function()
      builtin.find_files { cwd = dotconfig .. "/dot-config/nvim" }
    end,
    { desc = "Find file in nvim config", })
end
