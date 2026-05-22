_: {
  plugins.conform-nvim.settings.formatters_by_ft = {
    html = [ "prettierd" ];
    css = [ "prettierd" ];
    javascript = [ "prettierd" ];
    javascriptreact = [ "prettierd" ];
    "javascript.jsx" = [ "prettierd" ];
    typescript = [ "prettierd" ];
    typescriptreact = [ "prettierd" ];
    "typescript.tsx" = [ "prettierd" ];
    markdown = [ "prettierd" ];
    yaml = [ "prettierd" ];
    json = [ "jq" ];
    python = [
      "black"
      "isort"
    ];
    c = [ "clang-format" ];
    cpp = [ "clang-format" ];
    rust = [ "rustfmt" ];
    lua = [ "stylua" ];
    bash = [
      "shellcheck"
      "shellharden"
      "shfmt"
    ];
    ocaml = [ "ocamlformat" ];
    "_" = [ "trim_whitespace" ];
  };
}
