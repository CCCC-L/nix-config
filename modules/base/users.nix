{ config, pkgs, inputs, mylib, myvars, homeModules, ... }: {
  # 不允许在配置之外更改用户信息
  users.mutableUsers = false;

  users.groups = {
  "${myvars.username}" = {};
  docker = {};
  };

  users.users."${myvars.username}" = {
    inherit (myvars) initialHashedPassword;
    home = "/home/${myvars.username}";
    isNormalUser = true;
    extraGroups = [
      myvars.username
      "users"
      "wheel"
      "docker"
    ];
  };
}
