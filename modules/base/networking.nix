{
  networking.networkmanager.enable = true;

  # NTP 服务器
  networking.timeServers = [
    "ntp.aliyun.com" # Aliyun NTP Server
    "ntp.tencent.com" # Tencent NTP Server
  ];
}
