{ 
  config,
  pkgs, 
  inputs, 
  mylib, 
  myvars, 
  homeModules ? [], 
  system, 
  genSpecialArgs, 
  ...
}@ args: let
  homeSpecialArgs = (genSpecialArgs system);
in {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  nix.package = pkgs.nixVersions.latest;

  users.users.${myvars.username} = {
    description = myvars.userfullname;
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEQhFsu50YzPa3vetfBOZeILVT8mhEMKaPw4kVsFXMUH cong@DESKTOP-PD650OE" ];
  };
  
  nix.settings = {
    # 启动Flakes
    experimental-features = ["nix-command" "flakes"];
    # 
    trusted-users = [myvars.username];

    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
    ];

    # 允许使用二进制文件
    builders-use-substitutes = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${myvars.username}.imports = homeModules;
    extraSpecialArgs = homeSpecialArgs;
    #{ inherit mylib myvars inputs;};
  };
}

