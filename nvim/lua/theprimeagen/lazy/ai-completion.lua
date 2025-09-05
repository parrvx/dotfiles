return {
  "nomnivore/ollama.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  keys = {
    {
      "<leader>ai",
      function()
        require("ollama").complete()
      end,
      mode = "i",
      desc = "AI Complete",
    },
    -- ADICIONE ESTE NOVO ATALHO
    {
      "<leader>ae",
      function()
        require("ollama").action("Explain")
      end,
      mode = "v", -- 'v' para modo Visual (quando você seleciona texto)
      desc = "AI Explain",
    },
  },

  opts = {
    model = "stable-code:3b",
    completion = {
      enable = true,
      enable_on_insert = false,
    },
    actions = {
      -- O nome aqui ("Explain") deve corresponder ao que está no atalho acima
      Explain = {
        prompt = "Explique o seguinte código ou texto em português: ```\n%s\n```",
        action = "display",
      },
    },
  },
}
