return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
    dependencies = {
      {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
          require("gitsigns").setup()
        end
      }
    },
  },
}
