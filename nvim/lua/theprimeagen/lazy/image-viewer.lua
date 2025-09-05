return {
  "edluffy/hologram.nvim",
  -- Carrega o plugin quando necessário para manter a inicialização rápida
  event = "VeryLazy",
  config = function()
    require('hologram').setup({
      -- A detecção automática geralmente funciona bem,
      -- especialmente com o Kitty.
      auto_display = true,
    })
  end,
}

--[[
-- CONFIGURAÇÃO ANTIGA (agora desativada)

return {
  "3rd/image.nvim",
  opts = {
    backend = "kitty",
  },
}
--]]
