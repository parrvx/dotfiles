-- Substitua o conteúdo do seu arquivo por este:

return {
    "folke/trouble.nvim",
    -- ⭐ OTIMIZAÇÃO:
    -- Define atalhos que carregarão o plugin quando pressionados.
    keys = {
        {
            "<leader>tt",
            function()
                require("trouble").toggle()
            end,
            desc = "Toggle Trouble",
        },
    },
    config = function()
        require("trouble").setup({
            icons = false,
        })
        -- Mapeamentos adicionais podem ser movidos para a seção 'keys'
        -- ou mantidos aqui, pois a configuração só roda após o carregamento.
        vim.keymap.set("n", "[t", function()
            require("trouble").next({skip_groups = true, jump = true});
        end)

        vim.keymap.set("n", "]t", function()
            require("trouble").previous({skip_groups = true, jump = true});
        end)
    end,
}
