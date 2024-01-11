return {
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    'tpope/vim-sleuth',
    'tpope/vim-surround',
    'towolf/vim-helm',

    { 'folke/which-key.nvim',  opts = {} },

    { 'numToStr/Comment.nvim', opts = {} },

    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require('symbols-outline').setup()
        end
    },

    'vim-test/vim-test',
    {
        "iamcco/markdown-preview.nvim",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
        cmd = {
            "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle"
        },
        event = "BufRead",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
}
