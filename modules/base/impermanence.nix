{config, inputs, pkgs, lib, myvars, ... }: with lib; let 
  cfg = config.base'.impermanence;

in {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  options.base'.impermanence = {
    enable = mkEnableOption "impermanence";

    system = {
      directories = mkOption {
        type = types.listOf (types.either types.str (types.attrsOf types.anything));
        default = [];
        description = "映射的系统目录";
      };
      files = mkOption {
        type = types.listOf (types.either types.str (types.attrsOf types.anything));
        default = [];
        description = "映射的系统文件";
      };
    };

    user = {
      directories = mkOption {
        type = types.listOf (types.either types.str (types.attrsOf types.anything));
        default = [];
        description = "映射的用户目录";
      };
      files = mkOption {
        type = types.listOf (types.either types.str (types.attrsOf types.anything));
        default = [];
        description = "映射的用户文件";
      };
    };
  };

  config = lib.mkMerge [
    { environment.persistence."/persist".enable = lib.mkDefault false; }  # 因为默认是开启，所以这里先关闭下
    (mkIf cfg.enable {
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
          "/var/log"  # 系统日志
          "/var/lib"  # 系统状态数据
        ] ++ cfg.system.directories;

        files = [
          "/etc/machine-id"  # 机器唯一标识符
          "/etc/ssh/ssh_host_ed25519_key.pub"
          "/etc/ssh/ssh_host_ed25519_key"
          "/etc/ssh/ssh_host_rsa_key.pub"
          "/etc/ssh/ssh_host_rsa_key"
        ] ++ cfg.system.files;

        users.${myvars.username} = {
          directories = [
            {
              directory = ".ssh";
              mode = "0700";
            }
            
            ".config/nix-config"
            ".local/share/nvim"
          ] ++ cfg.user.directories;

          files = cfg.user.files;
        };
      };
    })
  ];
}