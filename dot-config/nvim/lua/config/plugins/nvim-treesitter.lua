return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    enabled = false,
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "haskell", "rust" },
        auto_install = true,
      })
    end
  },
}
