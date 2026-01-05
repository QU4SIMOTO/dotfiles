return function()
  -- Setup capabilities with nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend(
    'force',
    capabilities,
    require('cmp_nvim_lsp').default_capabilities()
  )

  -- Set default capabilities for all servers
  vim.lsp.config('*', {
    capabilities = capabilities,
  })

  vim.lsp.config('rust_analyzer', {
    settings = {
      ['rust-analyzer'] = {},
    },
  })
  vim.lsp.enable 'rust_analyzer'

  vim.lsp.config.bashls = {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'bash', 'sh' }
  }
  vim.lsp.enable 'bashls'

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
            vim.env.VIMRUNTIME,
            "${3rd}/luv/library"
          }
        }
      })
    end,
    settings = {
      Lua = {}
    }
  })
  vim.lsp.enable 'lua_ls'

  -- Terraform LSP
  vim.lsp.enable 'tflint'

  -- Typescript LSP
  vim.lsp.enable 'ts_ls'

  -- Haskell LSP
  vim.lsp.config('hls', {
    filetypes = { "haskell", "lhaskell", "cabal" }
  })
  vim.lsp.enable 'hls'

  -- Markdown LSP
  vim.lsp.enable 'marksman'

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
  vim.lsp.enable 'pylsp'

  -- Zig LSP
  vim.lsp.enable 'zls'

  -- Better diagnostic configuration
  vim.diagnostic.config({
    virtual_text = {
      source = "if_many",
      prefix = "●",
    },
    float = {
      source = "if_many",
      border = "rounded",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  })

  -- Customize diagnostic signs
  local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "»" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
  vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end)
  vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end)
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)

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
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

      -- Format with conform if available, otherwise LSP
      vim.keymap.set("n", "<C-f>", function()
        local conform_ok, conform = pcall(require, "conform")
        if conform_ok then
          conform.format({ async = true, lsp_fallback = true })
        else
          vim.lsp.buf.format({ async = true })
        end
      end, opts)

      -- Disable semantic tokens for performance
      if client then
        client.server_capabilities.semanticTokensProvider = nil
      end

      -- Enable inlay hints if supported (Neovim 0.10+)
      if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
        vim.keymap.set("n", "<leader>ih", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { buffer = ev.buf, desc = "Toggle inlay hints" })
      end
    end,
  })
end
