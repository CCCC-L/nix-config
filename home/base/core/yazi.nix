{ pkgs, pkgs-unstable, ... }: {
  # 终端上的文件管理器
  programs.yazi = {
    enable = true;
    package = pkgs-unstable.yazi;
    # 退出Yazi时更改目录
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_dir_first = true;
      };
    };
  };
}
