{lib, mylib, ...}: {
  imports = mylib.scanPaths ./. ++ [
    ../base
    ../base.nix
  ];
}
