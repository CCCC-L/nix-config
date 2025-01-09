{ lib, myvars, ... }: {
  programs.ssh.startAgent = true;

  services.openssh = {
    enable = true;
    # 放开sshd的端口
    openFirewall = true;
    settings = {
      # 允许使用密钥登录Root用户，用于远程部署
      PermitRootLogin = "prohibit-password";
      # 禁止密码登录
      PasswordAuthentication = false;
    };
  };

  # Add terminfo database of all known terminals to the system profile.
  # https://github.com/NixOS/nixpkgs/blob/nixos-24.05/nixos/modules/config/terminfo.nix
  environment.enableAllTerminfo = true;

}