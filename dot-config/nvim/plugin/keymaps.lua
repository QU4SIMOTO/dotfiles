vim.keymap.set("n", "<Space>", "<Nop>",{ silent = true, desc = "Space is the leader key" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "Escape is annoying to reach", })
vim.keymap.set("n", "<Leader>w", "<Cmd>w<CR>", { desc = "Save current buffer" })
vim.keymap.set("n", "<Leader><Leader>", "<c-^>", { desc = "Toggle most recent buffer" })
vim.keymap.set('n', "<Leader>m", "ct_", { desc = "Replace up to '_'" })

-- Execute lua
vim.keymap.set("n", "<Leader>xl", "<Cmd>.lua<CR>", { desc = "Execute the current line" })
vim.keymap.set("v", "<Leader>xl", ":lua<CR>", { desc = "Execute the current selection" })
vim.keymap.set("n", "<Leader>xx", "<Cmd>source %<CR>", { desc = "Execute the current file" })

-- Clipboard copy and paste
vim.keymap.set({ "n", "x" }, "<Leader>c", '"+y')
vim.keymap.set({ "n", "x" }, "<Leader>p", '"+p')

-- Format buffer
vim.keymap.set({ "n", "v" }, "<Leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- always center search results
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })
vim.keymap.set("n", "*", "*zz", { silent = true })
vim.keymap.set("n", "#", "#zz", { silent = true })
vim.keymap.set("n", "g*", "g*zz", { silent = true })

-- "very magic" (less escaping needed) regexes by default
vim.keymap.set("n", "?", "?\\v")
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("c", "%s/", "%sm/")

-- open new file adjacent to current file
vim.keymap.set("n", "<Leader>o",
  ":e <C-R>=expand('%:p:h') . '/' <CR>",
  { desc = "Open new file adjacent to current file", }
)

-- no arrow keys --- force yourself to use the home row
vim.keymap.set("n", "<up>", "<Nop>")
vim.keymap.set("n", "<down>", "<Nop>")
vim.keymap.set("i", "<up>", "<Nop>")
vim.keymap.set("i", "<down>", "<Nop>")
vim.keymap.set("i", "<left>", "<Nop>")
vim.keymap.set("i", "<right>", "<Nop>")

-- let the left and right arrows be useful: they can switch buffers
vim.keymap.set("n", "<left>", "<Cmd>bp<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<right>", "<Cmd>bn<cr>", { desc = "Next buffer" })

