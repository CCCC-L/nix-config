{ inputs, lib, myvars, mylib, system, ... }@ args: let
  name = "vmware";

  modules = {
    nixosModules = map mylib.relativeToRoot [
      "modules/server"
    ];

    homeModules = map mylib.relativeToRoot [
      "home/linux/tui.nix"
    ];
  };

  inherit (inputs) nixpkgs;

in {
  ${name} = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = (modules // args);

    modules = [{
      imports = [
        ./disko.nix
        ./hardware-configuration.nix
        ./impermanence.nix
      ] ++ modules.nixosModules;

      networking.hostName = name;

      zramSwap.memoryPercent = 50;  # 设置zram大小为内存的50%
    }];
  };
}
