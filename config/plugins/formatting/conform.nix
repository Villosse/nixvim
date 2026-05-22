_: {
  imports = [
    ./filetypes.nix
    ./formatters.nix
  ];
  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_on_error = true;

      format_on_save.__raw = ''
        function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          local config_files = {
            ".prettierrc", ".prettierrc.js", ".prettierrc.json", ".prettierrc.yaml", ".prettierrc.yml", "prettier.config.js",
            ".ocamlformat",
            "rustfmt.toml", ".rustfmt.toml",
            ".stylua.toml", "stylua.toml",
            "pyproject.toml", "setup.cfg",
            ".clang-format",
            "dune-project",
            "flake.nix",
          }
          local bufpath = vim.api.nvim_buf_get_name(bufnr)
          local root = vim.fs.root(bufpath, config_files)
          if not root then
            return
          end
          return { lsp_format = "fallback", timeout_ms = 500 }
        end
      '';
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>tf";
      action.__raw = ''
        function()
          vim.g.disable_autoformat = not vim.g.disable_autoformat
          vim.notify(
            vim.g.disable_autoformat and "Format on save disabled" or "Format on save enabled",
            vim.log.levels.INFO
          )
        end
      '';
      options = {
        desc = "Toggle format on save (global)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>tF";
      action.__raw = ''
        function()
          vim.b.disable_autoformat = not vim.b.disable_autoformat
          vim.notify(
            vim.b.disable_autoformat and "Format on save disabled (buffer)" or "Format on save enabled (buffer)",
            vim.log.levels.INFO
          )
        end
      '';
      options = {
        desc = "Toggle format on save (buffer)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cf";
      action.__raw = ''
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end
      '';
      options = {
        desc = "Format buffer";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<leader>cf";
      action.__raw = ''
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end
      '';
      options = {
        desc = "Format selection";
        silent = true;
      };
    }
  ];

}
