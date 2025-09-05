return {
  "nomnivore/ollama.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    -- ✅ Modelo correto para o seu hardware
    model = "stable-code:3b",

    completion = {
      enable = true,
      enable_on_insert = true,
    },
    actions = {
      Explain = {
        prompt = "Explique o seguinte código em português: ```\n%s\n```",
        action = "display",
      },
    },
  },
}

