-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/image-viewer.lua

return {
  "3rd/image.nvim",
  opts = {
    -- Configuração padrão geralmente funciona bem
    backend = "kitty", -- ou 'ueberzug', 'kitty', 'chafa', etc., dependendo do seu terminal
  },
}

-- Como usar:
--
--     Coloque o cursor sobre o link da imagem, como ![[minha-imagem.jpg]].
--
--     Execute o comando :ImageOpen. Uma janela flutuante com a imagem aparecerá.
