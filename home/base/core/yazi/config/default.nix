{config, lib, pkgs, pkgs-unstable, ...}: let
  configPath = "${config.home.homeDirectory}/.config/nix-config/home/base/core/yazi/config";

in {
  # 终端上文件管理器
  xdg.configFile."yazi".source = config.lib.file.mkOutOfStoreSymlink configPath;

  programs.yazi = {
    enable = true;
    package = pkgs-unstable.yazi;
    enableBashIntegration = true;
  };

}
