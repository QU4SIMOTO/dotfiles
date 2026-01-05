return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>ff", desc = "Find files" },
      { "<leader>fg", desc = "Live grep" },
      { "<leader>fb", desc = "Find buffers" },
      { "<leader>fh", desc = "Help tags" },
      { "<leader>fr", desc = "Resume" },
      { "<leader>fp", desc = "Find in packages" },
      { "<leader>fc", desc = "Find in dotconfig" },
      { "<leader>fn", desc = "Find in nvim config" },
      { "<leader>fF", desc = "Find files (all)" },
    },
    dependencies = { "nvim-lua/plenary.nvim", },
    config = require "config.telescope",
  },
}
