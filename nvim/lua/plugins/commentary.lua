vim.api.nvim_create_autocmd("FileType", {
    pattern = "c,cpp,javascript,typescript",
    callback = function()
        vim.opt_local.commentstring = "// %s"
    end
})

