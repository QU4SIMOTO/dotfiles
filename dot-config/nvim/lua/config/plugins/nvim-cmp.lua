return {
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      'hrsh7th/vim-vsnip',
    },
    config = function()
      local cmp = require "cmp"

      cmp.setup({
	snippet = {
	  -- REQUIRED by nvim-cmp. get rid of it once we can
	  expand = function(args)
	    vim.fn["vsnip#anonymous"](args.body)
	  end,
	},
	mapping = cmp.mapping.preset.insert({
	  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
	  ["<C-f>"] = cmp.mapping.scroll_docs(4),
	  ["<C-Space>"] = cmp.mapping.complete(),
	  ["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
	  { name = "nvim_lsp" },
	}, {
	  { name = "path" },
	}),
	experimental = {
	  ghost_text = true,
	},
      })

      -- Enable completing paths in :
      cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
	  { name = "path" }
	})
      })
    end
  },
}
