{
  services.sunshine = {
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = false;
    settings = {
      capture = "wlr";
      output_name = "HEADLESS-1"; # 仮想ディスプレイの出力名。番号指定(1)は現行版では一致せずeDP-1(ミラー)にフォールバックする
    };
    applications.apps = [
      {
        name = "Desktop";
        image-path = "desktop.png";
        auto-detach = true;
        wait-all = true;
        exit-timeout = 5;
      }
    ];
  };
  boot.kernelModules = ["thunderbolt-net"];
  services.hardware.bolt.enable = true;

  networking = {
    networkmanager.unmanaged = ["enp0s31f6"];
    interfaces = {
      enp0s31f6 = {
        useDHCP = false;
        ipv4.addresses = [
          {
            address = "192.168.50.1";
            prefixLength = 24;
          }
        ];
      };
      thunderbolt0 = {
        useDHCP = false;
        ipv4.addresses = [
          {
            address = "192.168.50.1";
            prefixLength = 24;
          }
        ];
      };
    };
    firewall.interfaces = {
      enp0s31f6 = {
        allowedTCPPorts = [47984 47989 48010];
        allowedUDPPorts = [47998 47999 48000 48002];
      };
      thunderbolt0 = {
        allowedTCPPorts = [47984 47989 48010];
        allowedUDPPorts = [47998 47999 48000 48002];
      };
    };
  };
}
