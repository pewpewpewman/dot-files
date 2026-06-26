
--Basic Settings--
vim.o.number = true
vim.o.guicursor = 'n-v-i-c:block'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.smartindent = true
vim.o.wrap = false
vim.o.clipboard = 'unnamedplus'
vim.cmd('colorscheme vim')
vim.o.cursorline = true
vim.o.mouse = ""

--RustFmt options
vim.g.rustfmt_autosave = 1
vim.g.rustfmt_fail_silently = 0
vim.g.rustfmt_command = "rustfmt +nightly"

vim.cmd('autocmd BufNewFile,BufRead * setlocal formatoptions=')
vim.cmd('setglobal formatoptions=')
vim.o.splitright = true
vim.cmd('autocmd BufNewFile,BufRead * setlocal formatoptions+=cqn')

--Syntax Highlighting--
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
vim.o.termguicolors = true
--vim.cmd('au BufRead,BufNewFile *.rs set filetype=rust')

--Hide Built In Syntax Highlighting--
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
 vim.api.nvim_set_hl(0, group, {})
end

--Change Settings Per Lang--
vim.api.nvim_create_autocmd({'BufEnter', 'TabEnter', 'TabNew'}, {
    pattern = { "*" },
    callback = function()
        if vim.treesitter.language.add(vim.bo.filetype)
        then
            vim.treesitter.start()
	end
    end
})

--Loding Lazy And Plugins--
require("config.lazy")
