-- Substitua o conteúdo do arquivo por este:

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Garante que o tema seja carregado antes de outros plugins
    config = function()
      require("catppuccin").setup({
        -- O "flavour" (sabor) do tema.
        -- 'mocha' é o que você já usa no seu terminal Kitty.
        flavour = "mocha",

        -- ⭐ IMPORTANTE:
        -- Suas configurações anteriores indicavam uma preferência por fundo transparente.
        -- Esta opção replica esse comportamento, integrando o Neovim com o fundo
        -- semi-transparente do seu terminal Kitty. Mude para 'false' se preferir um fundo sólido.
        transparent_background = true,

        -- Estilos adicionais para melhor legibilidade
        styles = {
          comments = { "italic" },
          keywords = { "italic" },
        },

        -- Integração com outros plugins que você usa ou pode vir a usar
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
          },
          telescope = true,
          mason = true,
          cmp = true,
          -- Adicione outras integrações aqui conforme necessário
        },
      })

      -- Define o Catppuccin como o esquema de cores padrão
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
