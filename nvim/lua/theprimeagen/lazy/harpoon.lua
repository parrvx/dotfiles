return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- A função 'config' agora só contém o setup essencial do plugin.
    -- Os atalhos foram movidos para a tabela 'keys'.
    require("harpoon"):setup()
  end,
  keys = {
    {
      "<leader>a",
      function() require("harpoon"):list():add() end,
      desc = "Harpoon: Adicionar arquivo",
    },
    {
      "<C-e>",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon: Menu",
    },
    { "<C-h>", function() require("harpoon"):list():select(1) end, desc = "Harpoon: Arquivo 1" },
    { "<C-j>", function() require("harpoon"):list():select(2) end, desc = "Harpoon: Arquivo 2" },
    { "<C-k>", function() require("harpoon"):list():select(3) end, desc = "Harpoon: Arquivo 3" },
    { "<C-l>", function() require("harpoon"):list():select(4) end, desc = "Harpoon: Arquivo 4" },
    { "<C-S-P>", function() require("harpoon"):list():prev() end, desc = "Harpoon: Arquivo anterior" },
    { "<C-S-N>", function() require("harpoon"):list():next() end, desc = "Harpoon: Próximo arquivo" },
  },
}
