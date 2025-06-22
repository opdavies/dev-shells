require("conform").setup {
  formatters_by_ft = {
    nix = { "nixfmt" },
  },
}

require("lint").linters_by_ft = {
  nix = { "nix" },
}

local lspconfig = require "lspconfig"

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.nixd.setup {
  capabilities = capabilities,

  cmd = { "nixd" },

  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },

      formatting = {
        command = "nix fmt",
      },
    },
  },
}
