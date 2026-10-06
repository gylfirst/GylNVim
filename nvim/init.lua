local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("keymaps")
require("lazy").setup("plugins")
local lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"
if vim.fn.filereadable(lockfile) == 0 then
    vim.defer_fn(function()
        requiere("lazy").lock()
    end, 1000)
end

