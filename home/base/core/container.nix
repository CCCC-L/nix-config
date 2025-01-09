{ pkgs, ... }: {
  home.packages = with pkgs; [
    docker-compose
    dive # https://github.com/wagoodman/dive
    lazydocker # https://github.com/jesseduffield/lazydocker
  ];
}
