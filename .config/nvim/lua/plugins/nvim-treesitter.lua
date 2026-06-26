return
{
    'nvim-treesitter/nvim-treesitter',
    opts = {
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        highlight = { enable = false, additional_vim_regex_highlighting = false }
    }
}
