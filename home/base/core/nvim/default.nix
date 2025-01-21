{config, lib, pkgs, pkgs-unstable, ...}: let
  shellAliases = {
    v = "nvim";
    vdiff = "nvim -d";
  };

  configPath = "${config.home.homeDirectory}/.config/nix-config/home/base/core/nvim/config";

in {
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink configPath;
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
