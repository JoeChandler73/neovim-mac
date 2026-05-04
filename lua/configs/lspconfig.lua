require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "jsonls",
  "ts_ls",
  "bashls",
  "yamlls",
  "docker_language_server",
  "docker_compose_language_server",
}

vim.lsp.enable(servers)

vim.lsp.config("roslyn", {
  filetypes = { "cs", "razor" },
  settings = {
    ["csharp|inlay_hints"] = {
      csharp_enable_inlay_hints_for_implicit_object_creation = true,
      csharp_enable_inlay_hints_for_implicit_variable_types = true,
      csharp_enable_inlay_hints_for_lambda_parameter_types = true,
      csharp_enable_inlay_hints_for_types = true,
      csharp_enable_inlay_hints_for_indexer_parameters = true,
      csharp_enable_inlay_hints_for_literal_parameters = true,
      csharp_enable_inlay_hints_for_object_creation_parameters = true,
      csharp_enable_inlay_hints_for_other_parameters = true,
      csharp_enable_inlay_hints_for_parameters = true,
      csharp_enable_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
      csharp_enable_inlay_hints_for_parameters_that_match_argument_name = true,
      csharp_enable_inlay_hints_for_parameters_that_match_method_intent = true,
    },
    ["csharp|code_lens"] = {
      dotnet_enable_references_code_lens = true,
    },
    ["csharp|completion"] = {
      dotnet_show_name_completion_suggestions = true,
      dotnet_show_completion_items_from_unimported_namespaces = true,
    },
    ["csharp|background_analysis"] = {
      dotnet_analyzer_diagnostics_scope = "fullSolution",
      dotnet_compiler_diagnostics_scope = "fullSolution",
    },
  },
})

vim.lsp.enable "roslyn"
