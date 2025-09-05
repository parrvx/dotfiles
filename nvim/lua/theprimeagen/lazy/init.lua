return {

    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

    "eandrju/cellular-automaton.nvim",
    "gpanders/editorconfig.nvim",

    -- ✅ ADICIONE A LINHA ABAIXO
    -- Ela diz ao lazy.nvim para carregar a configuração do arquivo ai-completion.lua
    { import = "theprimeagen.lazy.ai-completion" },
}
