{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    neovim
  ];

  environment.variables.EDITOR = "nvim";
}