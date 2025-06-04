return {
  {
    "sbdchd/neoformat",
    enabled = true,
    config = function()
      vim.g.neoformat_try_node_exe = 1

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.ts", "*.js", "*.tsx", "*.json" },
        callback = function()
          vim.cmd("Neoformat")
        end
      })
    end
  }
}
