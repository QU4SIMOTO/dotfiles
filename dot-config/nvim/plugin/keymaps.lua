vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, desc = "Leader key" })
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<Leader>w", "<Cmd>w<CR>", { desc = "Save current buffer" })

vim.keymap.set("n", "<Leader>xl", "<Cmd>.lua<CR>", { desc = "Execute the current line" })
vim.keymap.set("n", "<Leader>xf", "<Cmd>source %<CR>", { desc = "Execute the current file" })

vim.keymap.set({ "n", "x" }, "<Leader>c", '"+y')
vim.keymap.set({ "n", "x" }, "<Leader>p", '"+p')
-- <Leader><Leader> toggles between buffers
vim.keymap.set("n", "<Leader><Leader>", "<c-^>", { desc = "Toggle most recent buffer" })
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
vim.keymap.set("n", "<Leader>o", ":e <C-R>=expand('%:p:h') . '/' <CR>")
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
vim.keymap.set('n', "<Leader>m", "ct_", { desc = "Replace up to '_'" })
