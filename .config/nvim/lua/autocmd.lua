local autocmd = vim.api.nvim_create_autocmd

-- Set tab width to 2
autocmd("FileType", {
        pattern = { "nix" },
        command = "set tabstop=2 shiftwidth=2 expandtab softtabstop=2",
})

autocmd("FileType", {
        pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.json", "*.jsonc" },
        command = "set tabstop=4 shiftwidth=4 expandtab softtabstop=4",
})

-- Remove trailing whitespaces
autocmd("BufWritePre", {
        pattern = { "*" },
        command = [[%s/\s\+$//e]],
})
