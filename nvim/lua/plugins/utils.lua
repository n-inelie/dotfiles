return {
    {
        'windwp/nvim-autopairs'
    },
    {
        'jinh0/eyeliner.nvim',
        config = function()
            require'eyeliner'.setup {
              highlight_on_key = true,
              dim = false            
            }
        end
    }
}