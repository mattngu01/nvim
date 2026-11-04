local enabled = {
  require 'custom.languages.python',
  require 'custom.languages.lua',
  require 'custom.languages.go',
}

local config = {
  -- You can use 'stop_after_first' to run the first available formatter from the list
  -- javascript = { "prettierd", "prettier", stop_after_first = true },

  -- Set formatter IDs in lua/custom/languages/<language>.lua.
  -- Find IDs with `:help conform-formatters`; definitions are in
  -- conform.nvim/lua/conform/formatters/. `:ConformInfo` shows available formatters.
  formatters_by_ft = {}, -- filetype = { 'formatter_id' }

  -- Set linter IDs in lua/custom/languages/<language>.lua.
  -- Find IDs in mfussenegger/nvim-lint's README or its lua/lint/linters/ directory.
  linters_by_ft = {}, -- filetype = { 'linter_id' }

  -- See `:help lspconfig-all` for a list of all the pre-configured LSPs
  lspservers = {}, -- lspservername = { opts }

  mason_tools = {},
}

for _, language in ipairs(enabled) do
  for ft, formatters in pairs(language.formatters_by_ft or {}) do
    config.formatters_by_ft[ft] = formatters
  end

  for ft, linters in pairs(language.linters_by_ft or {}) do
    config.linters_by_ft[ft] = linters
  end

  for server, opts in pairs(language.lspservers or {}) do
    config.lspservers[server] = opts
  end

  vim.list_extend(config.mason_tools, language.mason_tools or {})
end

return config
