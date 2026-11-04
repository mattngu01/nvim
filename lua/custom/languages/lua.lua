return {
  formatters_by_ft = {
    lua = { 'stylua' },
  },
  linters_by_ft = {},
  lspservers = {
    lua_ls = {
      -- cmd = { ... },
      -- filetypes = { ... },
      -- capabilities = {},
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
          -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
          -- diagnostics = { disable = { 'missing-fields' } },
        },
      },
    },
  }, -- lspservername = { opts }
  mason_tools = { 'stylua' },
}
