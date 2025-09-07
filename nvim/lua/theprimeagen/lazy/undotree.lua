return {
    "mbbill/undotree",
    -- O plugin agora será carregado quando esta tecla for pressionada
    keys = {
        {
            "<leader>u",
            function()
                vim.cmd.UndotreeToggle()
            end,
            desc = "Toggle Undotree"
        }
    },
    -- A opção 'cmd' não é mais necessária aqui
}
