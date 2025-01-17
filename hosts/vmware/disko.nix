{ inputs, ... }: {
  imports = [ inputs.disko.nixosModules.disko ];

  disko.devices = {
    disk = {
      sda = {
        device = "/dev/sda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "256M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              start = "257M";
              end = "-2GB";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = {
                  "/persistent" = {
                    mountpoint = "/persistent";
                    mountOptions = [ "compress=zstd" ];
                  };
                  "/nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                };
              };
            };
            swap = {
              size = "100%";
              content = {
                type = "swap";
                randomEncryption = false;
              };
            };
          };
        };
      };
    };

    nodev."/" = {
      fsType = "tmpfs";
      mountOptions = [ "mode=755" ];
    };
  };

  fileSystems."/persistent".neededForBoot = true;

  # 或许可能以后不让disko自动挂载分区而是只划分分区
  # disko.enableConfig = false;
  # fileSystems = {
  #   "/boot" = {
  #     device = "/dev/sda1";
  #     fsType = "vfat";
  #     options = [ "umask=0077" ];
  #   };
  #   "/" = {
  #     device = "/dev/sda2";
  #     fsType = "btrfs";
  #     options = [ "subvol=/" "compress=zstd" ];
  #   };
  #   "/home" = {
  #     device = "/dev/sda2";
  #     fsType = "btrfs";
  #     options = [ "subvol=/home" "compress=zstd" ];
  #   };
  #   "/nix" = {
  #     device = "/dev/sda2";
  #     fsType = "btrfs";
  #     options = [ "subvol=/nix" "compress=zstd" "noatime" ];
  #   };
  # };

  # swapDevices = [ { device = "/dev/sda3"; } ];
}
