return function()
  vim.lsp.config('rust_analyzer', {
    settings = {
      ['rust-analyzer'] = {},
    },
  })

  vim.lsp.config.bashls = {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'bash', 'sh' }
  }
  vim.lsp.enable 'bashls'

  -- Bash LSP
  --if not vim.lsp.config('bash_lsp') and vim.fn.executable("bash-language-server") == 1 then
  --  configs.bash_lsp = {
  --    default_config = {
  --      cmd = { "bash-language-server", "start" },
  --      filetypes = { "sh" },
  --      root_dir = require("lspconfig").util.find_git_ancestor,
  --      init_options = {
  --        settings = {
  --          args = {}
  --        }
  --      }
  --    }
  --  }
  --end
  --if configs.bash_lsp then
  --  lspconfig.bash_lsp.setup {}
  --end

  -- Lua LSP
  vim.lsp.config('lua_ls', {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
          path ~= vim.fn.stdpath('config')
          and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
        then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = {
            'lua/?.lua',
            'lua/?/init.lua',
          },
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
          }
        }
      })
    end,
    settings = {
      Lua = {}
    }
  })
  vim.lsp.enable'lua_ls'

  -- Terraform LSP
  vim.lsp.enable'tflint'

  -- Typescript LSP
  vim.lsp.enable'ts_ls'

  -- Haskell LSP
  vim.lsp.config('hls', {
    filetypes = { "haskell", "lhaskel", "cabal" }
  })

  -- Markdown LSP
  vim.lsp.enable'marksman'

  vim.lsp.config('pylsp', {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = { 'W391' },
            maxLineLength = 100
          }
        }
      }
    }
  })

  -- Zig LSP
  vim.lsp.enable'zls'

  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      -- vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
      -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<C-f>", function()
        vim.lsp.buf.format { async = true }
      end, opts)

      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if client then
        client.server_capabilities.semanticTokensProvider = nil
      end
    end,
  })
end
