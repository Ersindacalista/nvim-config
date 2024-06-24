
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"clangd", "eslint", "pyright", "cssls", "html"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      -- Make sure the language servers are installed
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          lspconfig[server_name].setup {}
        end,
        -- Custom handlers for specific servers
        ["clangd"] = function()
          lspconfig.clangd.setup {}
        end,
        ["eslint"] = function()
          lspconfig.eslint.setup {}
        end,
        ["pyright"] = function()
          lspconfig.pyright.setup {}
        end,
        ["cssls"] = function()
          lspconfig.cssls.setup {}
        end,
        ["html"] = function()
          lspconfig.html.setup {}
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup {}
        end,
      }
    end
  }
}
