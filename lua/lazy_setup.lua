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

return require("lazy").setup({ { import = "plugins" }, { import = "plugins.ui" }, { import = "plugins.luasnip" } }, {
	lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json", -- Config folder is readonly because of home manager
})
