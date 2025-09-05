-- ~/.config/nvim/lua/theprimeagen/lazy/zettel.lua
return {
  "epwalsh/obsidian.nvim",
  version = "*", -- Recomendo travar na versão principal mais recente
  lazy = true,
  -- Carrega o plugin em eventos específicos, como ao entrar em um buffer de markdown
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/github/vault/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/github/vault/**.md",
  },
  dependencies = {
    -- Obrigatório
    "nvim-lua/plenary.nvim",
    -- Recomendado para busca
    "nvim-telescope/telescope.nvim",
    -- Se você usa nvim-cmp para autocompletar
    "hrsh7th/nvim-cmp",
  },
  opts = {
    -- O diretório onde suas notas serão salvas.
    -- CRIE ESTE DIRETÓRIO: mkdir ~/pasta
    workspaces = {
      {
        name = "pessoal",
        path = "~/github/vault",
      },
    },

    -- Configuração para autocompletar títulos de notas ao digitar [[
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    -- Definição de como os links são tratados. O padrão é ótimo.
    mappings = {
      -- O comando `gf` (go file) passará a seguir os links [[wiki]].
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
    },

    -- Opcional: para criar notas diárias
    daily_notes = {
      folder = "diario", -- As notas diárias ficarão em ~/github/vault/diario
      date_format = "%Y-%m-%d",
    },
  },
}
