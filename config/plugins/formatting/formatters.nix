{
  lib,
  pkgs,
  ...
}:
{
  plugins.conform-nvim.settings.formatters = {
    black.command = lib.getExe pkgs.black;
    isort.command = lib.getExe pkgs.isort;

    nixfmt.command = lib.getExe pkgs.nixfmt;

    ocamlformat.command = lib.getExe pkgs.ocamlformat;

    prettierd.command = lib.getExe pkgs.prettierd;
    eslint_d.command = lib.getExe pkgs.eslint_d;

    stylua.command = lib.getExe pkgs.stylua;

    shellcheck.command = lib.getExe pkgs.shellcheck;
    shfmt.command = lib.getExe pkgs.shfmt;
    shellharden.command = lib.getExe pkgs.shellharden;

    jq.command = lib.getExe pkgs.jq;
    rustfmt.command = lib.getExe pkgs.rustfmt;
  };
}
