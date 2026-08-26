-- Basic Settings
vim.o.guicursor = 'n-v-i-c:block'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.smartindent = true
vim.o.wrap = false
vim.o.clipboard = 'unnamedplus'
vim.cmd('colorscheme vim')
vim.api.nvim_set_hl(0, 'Pmenu', { link = 'SignColumn' })
vim.o.cursorline = true
vim.o.mouse = ""

-- Enable both line and relative line number at once
vim.o.number = true
vim.o.relativenumber = true

-- LSP
vim.lsp.enable({
	'emmylua_ls',
	'rust_analyzer'
})

vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function (env)
		local client = assert(vim.lsp.get_client_by_id(env.data.client_id))
		local bufnr = env.buf

		-- Enable Auto-Complete
		vim.lsp.completion.enable(true, client.id, bufnr, {
			autotrigger = true,
			convert = function (item)
				return { abbr = item.label:gsub('%b()', '') }
			end
		})
		-- Enable on Ctrl x
		vim.keymap.set("i", "<c-x>", vim.lsp.completion.get, { desc = "trigger autocompletion" })
		-- Enable on Entering insert mode
		vim.api.nvim_create_autocmd('InsertEnter', {
			group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
			callback = function ()
				vim.lsp.completion.get()
			end
		})

		-- Enable on each key input
		local chars = {}
		for i = 32, 126 do
			table.insert(chars, string.char(i))
		end
		client.server_capabilities.completionProvider.triggerCharacters = chars

		-- Format On Save
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
			callback = function ()
				vim.lsp.buf.format() -- { bufnr = bufnr, id = client.id, timeout_ms = 1000 })
			end
		})

		-- Diagnostics
		vim.diagnostic.enable(true)
		vim.diagnostic.config({
			--virtual_text = true
			--log_level = vim.log.levels.ERROR
		})

		-- Inlay Hints
		-- vim.lsp.inlay_hint.enable(true)

		-- LSP Logging
		vim.lsp.log.set_level('debug')
	end
})

vim.cmd('autocmd BufNewFile,BufRead * setlocal formatoptions=')
vim.cmd('setglobal formatoptions=')
vim.o.splitright = true
vim.cmd('autocmd BufNewFile,BufRead * setlocal formatoptions+=cqn')

-- Syntax Highlighting
-- vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
vim.o.termguicolors = true

-- Hide Built In Syntax Highlighting
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
	vim.api.nvim_set_hl(0, group, {})
end

-- Change Settings Per Lang
vim.api.nvim_create_autocmd({ 'BufEnter', 'TabEnter', 'TabNew' }, {
	pattern = { "*" },
	callback = function ()
		if vim.treesitter.language.add(vim.bo.filetype) then
			vim.treesitter.start()
		end
	end
})

-- Loding Lazy And Plugins
require("config.lazy")
