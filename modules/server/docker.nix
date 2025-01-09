{ pkgs, ... }: {
  virtualisation = {
      docker = {
        enable = true;
        daemon.settings = {
          # https://docs.docker.com/storage/containerd/
          "features" = {"containerd-snapshotter" = true;};
        };

        # 使--restart=always 功能
        enableOnBoot = true;
      };
  };
}