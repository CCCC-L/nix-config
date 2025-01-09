{ lib, nixpkgs, ... }: {
  # 允许安装非自由的软件
  nixpkgs.config.allowUnfree = lib.mkForce true;

  # 每周回收一次垃圾
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  # 使用硬链接来节省空间并自动清理不需要的文件和数据
  nix.settings.auto-optimise-store = true;

  # 关闭nix-channel 有flakes 
  nix.channel.enable = false;

  nix.settings.substituters = [
    "https://mirrors.cernet.edu.cn/nix-channels/store"
  ];

  system.stateVersion = "24.11";
}
