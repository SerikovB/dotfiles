local km = vim.keymap.set

km("n", "<leader><space>", "<cmd>nohlsearch<cr>", { desc = "Remove search highlight" })
km("n", "<c-a>", "ggVG", { desc = "Select All" })

-- Window navigation
km("n", "<c-j>", "<cmd>wincmd j<cr>", { desc = "Focus Bottom", silent = true, })
km("n", "<c-k>", "<cmd>wincmd k<cr>", { desc = "Focus Top", silent = true })
km("n", "<c-h>", "<cmd>wincmd h<cr>", { desc = "Focus Left", silent = true })
km("n", "<c-l>", "<cmd>wincmd l<cr>", { desc = "Focus Right", silent = true })

-- Telescope
local tsb = require('telescope.builtin')
km('n', '<leader>ff', function () tsb.find_files({ no_ignore = false, hidden = false, }) end, { desc = "Find Files" })
km('n', '<leader>fg', function () tsb.live_grep({ additional_args = { "--hidden" }, }) end, { desc = "Find Files" })
km('n', '<leader>t', function () tsb.resume() end, { desc = "Resume Telescope" })
km('n', '<leader>fb', function () tsb.treesitter() end, { desc = "Treesitter" })

-- Harpoon
local harpoon = require('harpoon')
km('n', '<leader>a', function () harpoon:list():add() end, { desc = 'Harpoon add' })
km('n', '<C-e>', function () harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon menu' })

km('n', '<C-1>', function () harpoon:list():select(1) end, { desc = 'Select buffer 1' })
km('n', '<C-2>', function () harpoon:list():select(2) end, { desc = 'Select buffer 2' })
km('n', '<C-3>', function () harpoon:list():select(3) end, { desc = 'Select buffer 3' })
km('n', '<C-4>', function () harpoon:list():select(4) end, { desc = 'Select buffer 4' })

km('n', '<C-S-P>', function () harpoon:list():prev() end, { desc = 'Select next buffer' })
km('n', '<C-S-N>', function () harpoon:list():next() end, { desc = 'Select prev buffer' })


-- LSP keys
vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
                local opts = { buffer = event.buf }
                km('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                km('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                km('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                km('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                km('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                km('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                km('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                km('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                km({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                km('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end,
})

-- Russian Language Layout support
local function escape(str)
        local escape_chars = [[;,."|\]]
        return vim.fn.escape(str, escape_chars)
end

local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]
local en =       [[`qwertyuiop[]asdfghjkl;'zxcvbnmбю]]
local ru =       [[ёйцукенгшщзхъфывапролджэячсмить,.]]

vim.opt.langmap = vim.fn.join({
        escape(ru_shift) .. ';' ..escape(en_shift),
        escape(ru) .. ';' .. escape(en),
}, ',')
