{lib, ...}: {

  attrs = import ./attrs.nix {inherit lib;};

  relativeToRoot = lib.path.append ../.;

  scanPaths = dir: map (f: dir + "/${f}")
      (lib.filter (n: n != "default.nix" && lib.hasSuffix ".nix" n)
        (builtins.attrNames (builtins.readDir dir)));
}
