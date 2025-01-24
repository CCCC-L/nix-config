{config, lib, pkgs, pkgs-unstable, ...}: let
  shellAliases = {
    v = "nvim";
    vdiff = "nvim -d";
  };

  configPath = "${config.home.homeDirectory}/.config/nix-config/home/base/core/nvim/config";

  treesitterPath = pkgs.symlinkJoin {
    name = "treesitterPath";
    paths = pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
  };

in {
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink configPath;
  xdg.dataFile."nvim/lazy/nvim-treesitter/parser".source = config.lib.file.mkOutOfStoreSymlink "${treesitterPath}/parser";
  home.shellAliases = shellAliases;

  programs = {
    neovim = {
      enable = true;
      package = pkgs-unstable.neovim-unwrapped;

      viAlias = true;
      vimAlias = true;
    };
  };


}
