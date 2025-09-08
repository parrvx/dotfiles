vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "80"
vim.opt.conceallevel = 2
-- Localize a linha 'vim.opt.updatetime = 50' e altere-a.

-- ⭐ OTIMIZAÇÃO:
-- O valor original (50ms) é muito agressivo e faz com que eventos
-- como 'CursorHold' disparem constantemente. Aumentar este valor
-- para 300ms é um padrão mais seguro e eficiente, reduzindo a
-- carga na CPU sem prejudicar a funcionalidade da maioria dos plugins.
vim.opt.updatetime = 300

-- Desativa provedores não utilizados para limpar o :checkhealth
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
