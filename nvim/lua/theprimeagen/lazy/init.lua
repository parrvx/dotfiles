return {

    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

    -- "github/copilot.vim", -- Linha do Copilot removida ou comentada

    "eandrju/cellular-automaton.nvim",
    "gpanders/editorconfig.nvim",

    -- ✅ ADICIONE A LINHA ABAIXO
    -- Ela diz ao lazy.nvim para carregar a configuração do arquivo ai-completion.lua
    { import = "theprimeagen.lazy.ai-completion" },
}
