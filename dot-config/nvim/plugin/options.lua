-- never ever folding
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.foldlevelstart = 99
-- shorter timeout
vim.opt.timeoutlen = 750
-- keep more context on screen while scrolling
vim.opt.scrolloff = 2
-- never show me line breaks if they're not there
vim.opt.wrap = false
-- linumbering vim.opt.relativenumber = true vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.number = true
-- keep current content top + left when splitting
vim.opt.splitright = true
vim.opt.splitbelow = true
-- infinite undo!
-- NOTE: ends up in ~/.local/state/nvim/undo/
vim.opt.undofile = true
-- tabs
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.softtabstop = 0
vim.opt.tabstop = 8
vim.opt.expandtab = true
--" Decent wildmenu
-- in completion, when there is more than one match,
-- list all matches, and only complete to longest common match
vim.opt.wildmode = "list:longest"
vim.opt.wildignore = ".hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site"
-- case-insensitive search/replace
vim.opt.ignorecase = true
-- unless uppercase in search term
vim.opt.smartcase = true
-- never ever make my terminal beep
vim.opt.vb = true
-- more useful diffs (nvim -d)
--- by ignoring whitespace
vim.opt.diffopt:append("iwhite")
vim.opt.diffopt:append("algorithm:histogram")
vim.opt.diffopt:append("indent-heuristic")
-- when opening a file with a command (like :e),
-- don't suggest files like there:
-- show more hidden characters
-- also, show tabs nicer
vim.opt.listchars = "tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•"

vim.opt.swapfile = false
