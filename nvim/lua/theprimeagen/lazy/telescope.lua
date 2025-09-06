-- Substitua o conteúdo do seu arquivo por este:

return {
    "nvim-telescope/telescope.nvim",

    -- ⭐ AJUSTE: A propriedade 'cmd' foi removida.
    -- Ao remover a instrução de carregamento preguiçoso, garantimos
    -- que o lazy.nvim carregará o Telescope durante a inicialização.
    -- Desta forma, ele estará sempre disponível para uso imediato.

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pr', builtin.oldfiles, { desc = "Arquivos Recentes" })
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<Leader>pg', builtin.live_grep, {
            desc = '[F]ind by [G]rep' -- Descrição para o plugin which-key
        })
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}
