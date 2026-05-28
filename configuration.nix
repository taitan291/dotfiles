{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  i18n = {
    defaultLocale = "ja_JP.UTF-8";
    extraLocaleSettings = {
      LC_MESSAGES = "ja_JP.UTF-8";
      LC_TIME = "ja_JP.UTF-8";
    };
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-skk
          fcitx5-gtk
          kdePackages.fcitx5-configtool
        ];
      };
    };
  };
  environment.variables = {
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  services.xserver = {
    enable = true;
    xkb = {
      layout = "jp";
      variant = "106";
      options = "ctrl:nocaps";
    };
  };

  #font
  fonts = {
    packages = with pkgs; [
      ipaexfont
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif CJK JP" "Noto Color Emoji"];
        sansSerif = ["Noto Sans CJK JP" "Noto Color Emoji"];
      };
    };
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  users.users.taitan = {
    isNormalUser = true;
    description = "taitan";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.bash;
    home = "/home/taitan";
  };

  # HDMIオーディオ用ファームウェアの追加
  hardware.enableAllFirmware = true;
  services.udev.extraRules = ''
    # HDMIの抜き差し検知を安定させるためのルール（必要に応じて）
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{remove}="0"
  '';

  # GRUB
  boot.loader = {
    timeout = 60;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
  };

  # NetworkManager
  networking.networkmanager.enable = true;

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];

    # 接続試行回数とタイムアウト
    connect-timeout = 3;
    min-free-check-interval = 3;

    # ミラー
    substituters = [
      "https://cache.nixos.org/"
    ];

    # バイナリキャッシュが利用できない場合にソースからビルドを続行する
    fallback = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment = {
    pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];
    systemPackages = with pkgs; [
      sl
      gti

      git
      wget
      zip
      unzip
      gzip
      wl-clipboard
      ripgrep

      protonup-qt

      neovim

      #other
      os-prober
    ];
  };
  programs.hyprland = {
    enable = true;
  };
  programs.dconf.enable = true;

  networking.hostName = "nixos";

  time.timeZone = "Asia/Tokyo";

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = {
    "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
      "bluez5.roles" = ["hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag"];
    };
  };
  system.stateVersion = "25.11";
}
