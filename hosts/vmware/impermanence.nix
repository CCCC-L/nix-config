{inputs, pkgs, myvars, ... }: {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  environment.systemPackages = [
    # `sudo ncdu -x /`
    pkgs.ncdu
  ];

  environment.persistence."/persistent" = {
    # 不让这些映射的 mount 出现在文件管理器的侧边栏中
    hideMounts = true;

    directories = [
      "/etc/NetworkManager/system-connections"  # 网络连接配置
      "/etc/nix/inputs"  # Nix flake 输入
      "/etc/secureboot"  # 安全启动配置
      "/etc/agenix/"  # 密钥管理
      "/var/log"  # 系统日志
      "/var/lib"  # 系统状态数据
    ];

    files = [
      "/etc/machine-id"  # 机器唯一标识符
      "/etc/ssh/ssh_host_ed25519_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_rsa_key"
    ];

    users.${myvars.username} = {
      directories = [
        {
          directory = ".ssh";
          mode = "0700";
        }
        {
          directory = ".docker";  # Docker 配置
          mode = "0700";
        }

        ".config/nix-config"
        "codes"
      ];
    };
  };

}