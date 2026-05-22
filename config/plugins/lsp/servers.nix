{ lib, pkgs, ... }:
{
  plugins.lsp.servers = {
    lua_ls.enable = true;

    hls = {
      enable = true;
      installGhc = false;
    };

    ocamllsp.enable = true;

    jdtls.enable = true;

    cmake.enable = true;

    clangd = {
      enable = true;
      extraOptions = {
        capabilities = {
          offsetEncoding = [ "utf-16" ];
        };
        init_options = {
          usePlaceholders = true;
          completeUnimported = true;
          clangdFileStatus = true;
        };
      };
      cmd = [
        "clangd"
        "--background-index"
        "--clang-tidy"
        "--header-insertion=iwyu"
        "--completion-style=detailed"
        "--function-arg-placeholders"
        "--fallback-style=llvm"
      ];
    };

    rust_analyzer = {
      enable = true;
      installCargo = false;
      installRustc = false;
      settings.check.command = "clippy";
    };

    nixd = {
      enable = true;
      extraOptions.settings.nixd.formatting.command = [ "nix" "fmt" "--" ];
    };

    ts_ls.enable = true;

    eslint = {
      enable = true;
      extraOptions.settings.workingDirectories.mode = "auto";
    };

    jsonls.enable = true;

    gopls.enable = true;

    yamlls = {
      enable = true;
      extraOptions.settings.yaml = {
        validate = true;
        hover = true;
        completion = true;
        schemaStore = {
          enable = true;
          url = "https://www.schemastore.org/api/json/catalog.json";
        };
      };
    };

    pyright.enable = true;

    bashls.enable = true;
  };

}
