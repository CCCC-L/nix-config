当分好区后执行 `nixos-install --root /mnt --flake .#vmware --no-root-password --no-channel-copy --show-trace --verbose` 安装nixos。

重新编译则执行 `nixos-rebuild switch --flake .#vmware`