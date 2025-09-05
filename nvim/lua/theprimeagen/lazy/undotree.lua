-- Substitua o conteúdo do seu arquivo por este:

return {
    "mbbill/undotree",
    -- ⭐ OTIMIZAÇÃO:
    -- Carrega o plugin ao executar o comando :UndotreeToggle.
    cmd = "UndotreeToggle",
    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
}
