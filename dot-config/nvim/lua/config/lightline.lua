return function()
  vim.o.showmode = false
  vim.g.lightline = {
    colorscheme = "one",
    active = {
      left = {
        { "mode",      "paste" },
        { "gitbranch", "readonly", "filename", "modified" }
      },
      right = {
        { "lineinfo" },
        { "percent" },
        { "fileencoding", "filetype" }
      },
    },
    component_function = {
      filename = "LightlineFilename",
      gitbranch = "FugitiveHead"
    },
  }

  function LightlineFilenameInLua(opts)
    if vim.fn.expand("%:t") == "" then
      return "[No Name]"
    else
      return vim.fn.getreg("%")
    end
  end

  vim.api.nvim_exec(
    [[
    function! g:LightlineFilename()
    return v:lua.LightlineFilenameInLua()
    endfunction
    ]],
    true
  )
end
