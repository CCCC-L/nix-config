## 安装
### anywhere
当有一台Nixos主机且内存大于等于2GB时建议`nixos-anywhere`安装
``` bash
sudo nix run github:nix-community/nixos-anywhere -- --flake .#vmware root@192.168.61.132

# 内存小于2GB时可以尝试下面方法说不定可以
# https://github.com/nix-community/nixos-anywhere/issues/402#issuecomment-2479477069
```

### 最小化安装
当内存小于8GB 时建议分区最小化安装后再使用更新配置
```bash
sudo nixos-rebuild switch --flake .#vmware --show-trace  --verbose
```
> 分区安装可参考 https://nixos-cn.org/tutorials/installation/VirtualMachine.html#%E5%88%86%E5%8C%BA%E4%B8%8E%E6%A0%BC%E5%BC%8F%E5%8C%96

### disco && nixos-install
当内存等于8GB 时可使用以下两个命令来安装
``` bash
# 使用disco分区并挂载
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --yes-wipe-all-disks --mode destroy,format,mount --flake .#vmware

# 使用安装nixos
sodo nixos-install --root /mnt --flake .#vmware --no-root-password --no-channel-copy --show-trace --verbose
```

### disco-install
当内存大于8G 时可以使用以下命令直接安装
```bash
sudo nix --extra-experimental-features "nix-command flakes" run 'github:nix-community/disko/latest#disko-install' -- --write-efi-boot-entries --flake .#vmware  --disk sda /dev/sda
```

## 重新编译
重新编译则执行
``` bash
sudo nixos-rebuild switch --flake .#vmware --show-trace  --verbose
```

## 查看最后生成的配置
### nix eval
操作少，但是得到的数据是压缩在一块的。
```bash
# 查看全部的
nix eval .#nixosConfigurations.vmware.config
# 查看指定部分的
nix eval .#nixosConfigurations.vmware.config.fileSystems
# 以Json方式输出（有些时候会失败
nix eval --json .#nixosConfigurations.vmware.config.fileSystems
```

### nix p
更好的体验
```bash
nix repl
:lf .
:p nixosConfigurations.vmware.config.fileSystems
```

## 临时安装一些软件
```bash
nix shell -p gcc gnumake binutils
```