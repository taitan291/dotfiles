# nixpkgs から brave が削除された (2026-11-03) ため、upstream の deb から自前でパッケージ化する overlay。
# 定義は削除直前の nixpkgs (pkgs/by-name/br/brave/make-brave.nix) を x86_64-linux 向けに簡略化したもの。
# 更新時は version と hash を書き換える:
#   nix store prefetch-file https://github.com/brave/brave-browser/releases/download/v<version>/brave-browser_<version>_amd64.deb
final: prev: let
  inherit (final) lib;
in {
  brave = final.callPackage (
    {
      stdenv,
      fetchurl,
      dpkg,
      wrapGAppsHook3,
      alsa-lib,
      at-spi2-atk,
      at-spi2-core,
      atk,
      cairo,
      cups,
      dbus,
      expat,
      fontconfig,
      freetype,
      gdk-pixbuf,
      glib,
      adwaita-icon-theme,
      gsettings-desktop-schemas,
      gtk3,
      gtk4,
      qt6,
      libx11,
      libxscrnsaver,
      libxcomposite,
      libxcursor,
      libxdamage,
      libxext,
      libxfixes,
      libxi,
      libxrandr,
      libxrender,
      libxtst,
      libdrm,
      libkrb5,
      libuuid,
      libxkbcommon,
      libxshmfence,
      libgbm,
      nspr,
      nss,
      pango,
      pipewire,
      snappy,
      udev,
      wayland,
      xdg-utils,
      coreutils,
      libxcb,
      zlib,
      libpulseaudio,
      libGL,
      libva,
      # 常に付与するコマンドライン引数
      commandLineArgs ? "",
    }: let
      pname = "brave";
      version = "1.99.56";

      deps = [
        alsa-lib
        at-spi2-atk
        at-spi2-core
        atk
        cairo
        cups
        dbus
        expat
        fontconfig
        freetype
        gdk-pixbuf
        glib
        gtk3
        gtk4
        libdrm
        libx11
        libGL
        libxkbcommon
        libxscrnsaver
        libxcomposite
        libxcursor
        libxdamage
        libxext
        libxfixes
        libxi
        libxrandr
        libxrender
        libxshmfence
        libxtst
        libuuid
        libgbm
        nspr
        nss
        pango
        pipewire
        udev
        wayland
        libxcb
        zlib
        snappy
        libkrb5
        qt6.qtbase
        libpulseaudio
        libva
      ];

      rpath = lib.makeLibraryPath deps + ":" + lib.makeSearchPathOutput "lib" "lib64" deps;
      binpath = lib.makeBinPath deps;
    in
      stdenv.mkDerivation {
        inherit pname version;

        src = fetchurl {
          url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser_${version}_amd64.deb";
          hash = "sha256-W1r00Qh1j+XoK3yxGa8gOXepD8s0ubBzGTF/hj84vHI=";
        };

        dontConfigure = true;
        dontBuild = true;
        dontPatchELF = true;
        doInstallCheck = true;

        nativeBuildInputs = [
          dpkg
          wrapGAppsHook3
        ];

        buildInputs = [
          # GSETTINGS_SCHEMAS_PATH 用
          glib
          gsettings-desktop-schemas
          gtk3
          gtk4
          # XDG_ICON_DIRS 用
          adwaita-icon-theme
        ];

        installPhase = ''
          runHook preInstall

          mkdir -p $out $out/bin

          cp -R usr/share $out
          cp -R opt/ $out/opt

          export BINARYWRAPPER=$out/opt/brave.com/brave/brave-browser

          substituteInPlace $BINARYWRAPPER \
              --replace-fail /bin/bash ${stdenv.shell} \
              --replace-fail 'CHROME_WRAPPER' 'WRAPPER'

          ln -sf $BINARYWRAPPER $out/bin/brave

          for exe in $out/opt/brave.com/brave/{brave,chrome_crashpad_handler}; do
              patchelf \
                  --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
                  --set-rpath "${rpath}" $exe
          done

          substituteInPlace $out/share/applications/{brave-browser,com.brave.Browser}.desktop \
              --replace-fail /usr/bin/brave-browser-stable $out/bin/brave
          substituteInPlace $out/share/gnome-control-center/default-apps/brave-browser.xml \
              --replace-fail /opt/brave.com $out/opt/brave.com
          substituteInPlace $out/opt/brave.com/brave/default-app-block \
              --replace-fail /opt/brave.com $out/opt/brave.com

          for size in 16 24 32 48 64 128 256; do
              mkdir -p $out/share/icons/hicolor/''${size}x''${size}/apps
              ln -s $out/opt/brave.com/brave/product_logo_$size.png \
                  $out/share/icons/hicolor/''${size}x''${size}/apps/brave-browser.png
          done

          ln -sf ${xdg-utils}/bin/xdg-settings $out/opt/brave.com/brave/xdg-settings
          ln -sf ${xdg-utils}/bin/xdg-mime $out/opt/brave.com/brave/xdg-mime

          runHook postInstall
        '';

        preFixup = ''
          gappsWrapperArgs+=(
            --prefix LD_LIBRARY_PATH : ${rpath}
            --prefix PATH : ${binpath}
            --suffix PATH : ${lib.makeBinPath [xdg-utils coreutils]}
            --set CHROME_WRAPPER ${pname}
            --add-flags "--enable-features=AcceleratedVideoDecodeLinuxGL,AcceleratedVideoEncoder\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+,WaylandWindowDecorations --enable-wayland-ime=true}}"
            --add-flags "--disable-features=OutdatedBuildDetector,UseChromeOSDirectVideoDecoder"
            --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto}}"
            --add-flags ${lib.escapeShellArg commandLineArgs}
          )
        '';

        installCheckPhase = ''
          # upstream の wrapper はエラーを握り潰すので直接叩く
          $out/opt/brave.com/brave/brave --version
        '';

        meta = {
          homepage = "https://brave.com/";
          description = "Privacy-oriented browser for Desktop and Laptop computers";
          sourceProvenance = [lib.sourceTypes.binaryNativeCode];
          license = lib.licenses.mpl20;
          platforms = ["x86_64-linux"];
          mainProgram = "brave";
        };
      }
  ) {};
}
