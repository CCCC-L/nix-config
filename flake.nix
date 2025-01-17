{
  description = "NixOS 配置";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      inherit (inputs.nixpkgs) lib;
      mylib = import ./lib {inherit lib;};
      myvars = import ./vars {inherit lib;};

      genSpecialArgs = system:
        inputs // {
          inherit mylib myvars;
          # use unstable branch for some packages to get the latest updates
          pkgs-unstable = import inputs.nixpkgs-unstable {
            inherit system; # refer the `system` parameter form outer scope recursively
            # To use chrome, we need to allow the installation of non-free software
            config.allowUnfree = true;
          };
          pkgs-stable = import inputs.nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        };

      args = { inherit inputs lib mylib myvars genSpecialArgs; };

      mkHost = hostname: import ./hosts/${hostname} (args // {system = "x86_64-linux";});

      hostNames = builtins.attrNames (builtins.readDir ./hosts);

    in {
      nixosConfigurations = lib.attrsets.mergeAttrsList (map mkHost hostNames);
    };
}

