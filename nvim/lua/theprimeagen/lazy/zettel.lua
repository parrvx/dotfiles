return {
  "epwalsh/obsidian.nvim",
  version = "*", -- Recomendo usar a versão mais recente

  -- ⭐️ ESTRATÉGIA DE CARREGAMENTO
  -- Carrega o plugin apenas quando um arquivo markdown for aberto.
  -- É a forma mais eficiente e confiável.
  lazy = true,
  ft = { "markdown" },

  -- ⭐️ MAPEAMENTO DE TECLAS (ATAHOS)
  -- Esta função é executada assim que o plugin é ativado em um arquivo.
  -- É o lugar ideal para criar seus atalhos.
  on_attach = function(bufnr)
    -- Mapeamentos para o buffer atual, para não interferir em outros arquivos.
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    -- Atalho essencial: Pressionar 'Enter' em um link para abri-lo ou criá-lo.
    map("<CR>", require("obsidian").action.follow_link, "Seguir/Criar link [Enter]")

    -- Alternar o estado de um checkbox [-] [x]
    map("<leader>ch", require("obsidian").util.toggle_checkbox, "Alternar checkbox")

    -- NAVEGAÇÃO E BUSCA (Funções para estudar e navegar)
    -- Para estes atalhos, <leader> geralmente é a tecla '\' ou 'espaço'.

    -- Abre o "Quick Switcher": uma busca rápida por títulos de notas (similar ao Ctrl+O no Obsidian).
    map("<leader>zz", function() require("telescope.builtin").find_files({ cwd = require("obsidian.client").get_current_workspace().path }) end, "Buscar notas (Telescope)")
    -- Busca por conteúdo em todas as suas notas. Extremamente útil.
    map("<leader>zs", function() require("telescope.builtin").live_grep({ cwd = require("obsidian.client").get_current_workspace().path }) end, "Buscar por texto (Telescope)")

    -- Busca por tags em todas as suas notas.
    map("<leader>zt", function() require("obsidian").action.picker_tags() end, "Buscar por tags")

    -- Cria uma nova nota a partir de um template.
    map("<leader>znt", function() require("obsidian").action.new_note_from_template() end, "Nova nota com template")
  end,

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim", -- Essencial para busca
    "hrsh7th/nvim-cmp",         -- Para autocompletar
  },

     -- ⭐️ OPÇÕES PRINCIPAIS DO PLUGIN
  opts = {
    -- ✅ CONFIGURAÇÃO DO SEU VAULT (WORKSPACE)
    -- Esta é a configuração mais importante.
    workspaces = {
      {
        name = "pessoal",
        -- CORREÇÃO: O caminho para o vault agora é lido a partir de uma variável de ambiente chamada 'OBSIDIAN_VAULT'.
        -- Isso torna a configuração portátil e fácil de gerenciar em diferentes máquinas.
        -- Para configurar, adicione 'export OBSIDIAN_VAULT="/caminho/para/seu/vault"' ao seu .bashrc ou .zshrc.
        -- Como fallback, ele ainda usa o caminho antigo se a variável não estiver definida.
        path = vim.fn.expand(os.getenv("OBSIDIAN_VAULT") or "~/github/vault"),
      },
    },

    -- ✅ COMO OS NOMES DAS NOTAS SÃO CRIADOS
    -- Esta é a sua função personalizada que já havíamos definido.
    -- Ex: [[Nova Nota]] -> cria o arquivo "nova-nota-20250905.md"
    note_id_func = function(title)
      if title == nil then
        return os.date("%Y%m%d")
      end
      local slug = title:lower()
      slug = slug:gsub("%s+", "-")
      slug = slug:gsub("[^%w%-]", "")
      return slug .. "-" .. os.date("%Y%m%d")
    end,

    -- ✅ NOTAS DIÁRIAS (Daily Notes)
    -- Perfeito para diários de estudo, de trabalho, etc.
    daily_notes = {
      folder = "diario", -- Salva as notas diárias em '~/github/vault/diario'
      date_format = "%Y-%m-%d", -- Formato do nome do arquivo (ex: 2025-09-05.md)
      alias_format = "%A, %d de %B de %Y", -- Como o título da nota aparecerá
      -- Você pode criar um arquivo em '~/github/vault/templates/diaria.md'
      -- e ele será usado como modelo para toda nova nota diária.
      template = "diaria.md",
    },

    -- ✅ TEMPLATES
    -- Use templates para padronizar a criação de notas.
    templates = {
      folder = "templates", -- Os templates ficam em '~/github/vault/templates'
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },

    -- ✅ INTEGRAÇÃO COM TELESCOPE PARA BUSCA
    -- Define o Telescope como a ferramenta de busca padrão do plugin.
    picker = {
      name = "telescope.nvim",
    },

    -- Ao buscar, ordena as notas pela data de modificação mais recente.
    sort_by = "modified",
    sort_reversed = true,

    -- ✅ AUTOCOMPLETAR
    -- Ativa o autocompletar para links [[...]] e #tags.
    completion = {
      nvim_cmp = true,
      min_chars = 2, -- Começa a sugerir após 2 caracteres
    },

    -- ✅ ANEXOS (IMAGENS)
    -- Configura onde as imagens coladas serão salvas.
    attachments = {
      img_folder = "assets/imgs", -- Salva em '~/github/vault/assets/imgs'
    },

    -- ✅ QUALIDADE DE VIDA
    -- Permite que o Neovim abra links externos (http://...) no seu navegador.
    follow_url_func = function(url)
      -- Para Linux (mais comum entre usuários Neovim)
      vim.fn.jobstart({ "xdg-open", url })
      -- Para Mac OS, descomente a linha abaixo e comente a de cima.
      -- vim.fn.jobstart({"open", url})
    end,

    -- Melhora a aparência de checkboxes, links, etc.
    -- ⚠️ ATENÇÃO: Para os ícones funcionarem, você precisa de uma "Nerd Font" instalada.
    -- Se os ícones aparecerem como quadrados estranhos, use a configuração alternativa comentada abaixo.
    ui = {
      enable = false,
      update_debounce = 200,
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["!"] = { char = "", hl_group = "ObsidianImportant" },
      },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      -- ✍️ Alternativa sem Nerd Font:
      -- checkboxes = {
      --   [" "] = { char = "☐", hl_group = "ObsidianTodo" },
      --   ["x"] = { char = "✔", hl_group = "ObsidianDone" },
      -- },
    },
  },
}
