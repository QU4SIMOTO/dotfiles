return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme nord]]
      vim.g.nord_disable_background = true
      require("nord").set()
    end,
  },
}
