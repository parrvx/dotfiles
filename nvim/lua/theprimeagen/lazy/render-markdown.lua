return {
  "MeanderingProgrammer/render-markdown.nvim",
  -- Carrega o plugin apenas para arquivos markdown, melhorando o tempo de inicialização
  ft = { "markdown" },
  opts = {
    -- Suas opções existentes estão ótimas, mantive-as como estão
    bullet = {
      enabled = true,
    },

    checkbox = {
      enabled = true,
      position = "overlay",
      unchecked = {
        -- CORREÇÃO: Remova o espaço depois do ícone
        icon = "󰄱",
        highlight = "RenderMarkdownUnchecked",
      },
      checked = {
        -- CORREÇÃO: Remova o espaço depois do ícone
        icon = "󰱒",
        highlight = "RenderMarkdownChecked",
      },
    },

    html = {
      enabled = true,
      comment = { conceal = false },
    },
    link = {
      image = vim.g.neovim_mode == "skitty" and "" or "󰥶 ",
      custom = {
        youtu = { pattern = "youtu%.be", icon = "󰗃 " },
      },
    },
    heading = {
      -- Ícones e nomes dos highlights continuam os mesmos
      icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
      backgrounds = { "Headline1Bg", "Headline2Bg", "Headline3Bg", "Headline4Bg", "Headline5Bg", "Headline6Bg" },
      foregrounds = { "Headline1Fg", "Headline2Fg", "Headline3Fg", "Headline4Fg", "Headline5Fg", "Headline6Fg" },
    },
    code = {
      style = "none",
    },
  },
  -- ✅ A MÁGICA ACONTECE AQUI
  config = function(_, opts)
    -- Aplica as opções ao plugin
    require("render-markdown").setup(opts)

    -- Cria um grupo de autocmd para garantir que nossos highlights
    -- sejam aplicados DEPOIS do tema de cores ser carregado.
    local augroup = vim.api.nvim_create_augroup("RenderMarkdownHighlights", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = augroup,
      pattern = "*",
      callback = function()
        -- Definição dos highlights. Você pode customizar as cores aqui.
        -- O 'default = true' previne erros caso o highlight já exista.
        vim.api.nvim_set_hl(0, "RenderMarkdownChecked", { fg = "green", default = true })
        vim.api.nvim_set_hl(0, "RenderMarkdownUnchecked", { fg = "gray", default = true })
        vim.api.nvim_set_hl(0, "Headline1Bg", { bg = "#1a1a1a", default = true })
        vim.api.nvim_set_hl(0, "Headline1Fg", { fg = "#c678dd", bold = true, default = true })
        vim.api.nvim_set_hl(0, "Headline2Bg", { bg = "#1a1a1a", default = true })
        vim.api.nvim_set_hl(0, "Headline2Fg", { fg = "#61afef", bold = true, default = true })
        vim.api.nvim_set_hl(0, "Headline3Bg", { bg = "#1a1a1a", default = true })
        vim.api.nvim_set_hl(0, "Headline3Fg", { fg = "#e5c07b", bold = true, default = true })
        -- Adicione os outros headlines aqui se precisar
      end,
    })
  end,
}
