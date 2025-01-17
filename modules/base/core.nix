{lib, ...}: {
  boot.loader.systemd-boot = {
    # 保留最多十条引导
    configurationLimit = lib.mkDefault 10;
    #  systemd-boot控制台为最高分辨率
    consoleMode = lib.mkDefault "max";
  };

  # 最多等待五秒
  boot.loader.timeout = lib.mkDefault 5;

  # 电源管理
  services = {
    power-profiles-daemon = {
      enable = true;
    };
    upower.enable = true;
  };

  # 启动zram
  zramSwap = {
    enable = true;
  };
}
