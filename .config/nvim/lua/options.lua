vim.opt.conceallevel = 3
vim.opt.swapfile = false
vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.fileformat = "unix"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 8

vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.softtabstop = 8
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.g.editorconfig = false
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 800

vim.diagnostic.config({
        signs = {
                text = {
                        [vim.diagnostic.severity.ERROR] = '✘',
                        [vim.diagnostic.severity.WARN] = '▲',
                        [vim.diagnostic.severity.HINT] = '⚑',
                        [vim.diagnostic.severity.INFO] = '»',
                },
        },
})
