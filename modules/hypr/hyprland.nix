{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    # plugins = [
    #   pkgs.hyprlandPlugins.hypr-dynamic-cursors
    # ];
    settings = {
      monitor = [
        ",preferred,auto,1"
      ];
      # plugin = {
      #   dynamic-cursors = {
      #     enabled = true;
      #     mode = "none";
      #     shake = {
      #       enabled = true;
      #       threshold = 4.0;
      #       base = 4.0;
      #       speed = 6.0;
      #       influence = 0.0;
      #       limit = 0.0;
      #       timeout = 2500;
      #     };
      #   };
      # };

      "$terminal" = "ghostty";
      "$fileManager" = "thunar";
      "$menu" = "wofi --show drun";
      "$browser" = "brave";
      "$mainMod" = "SUPER";
      "$hyprshot" = "/home/taitan/Pictures/Screenshots";

      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "nm-applet"
        "dunst"
        "fcitx5 -d"
        "hyprctl setcursor breeze_cursors 24"
      ];
      env = [
        # fcitx5
        "QT_IM_MODULE,fcitx5"
        "GTK_IM_MODULE=fcitx5"
        "XMODIFIERS,@im=fcitx5"
        # hyprland
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_CURRENT_DESKTOP,Hyprland"
      ];

      # 一般設定
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      # デコレーション
      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # アニメーション
      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear, 0, 0, 1, 1"
          "almostLinear, 0.5, 0.5, 0.75, 1"
          "quick, 0.15, 0, 0.1, 1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
          "zoomFactor, 1, 7, quick"
        ];
      };
      # レイアウト
      dwindle = {
        #pseudotile = true;
        preserve_split = true;
      };
      # その他
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      # 入力設定
      input = {
        kb_layout = "jp";
        kb_variant = "";
        kb_rules = "evdev";
        kb_options = "ctrl:nocaps";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      windowrule = [
        {
          name = "discord-workspace";
          workspace = 11;
          "match:class" = "^(Discord|discord)$";
        }
      ];

      #キーバインド
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, N, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod SHIFT, J, layoutmsg, togglesplit"
        "$mainMod, B, exec, $browser"
        "$mainMod, M, exec, missioncenter"
        "$mainMod, X, exec, wlogout"

        # フォーカス移動
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # ワークスペース切り替え
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, D, workspace, 11"

        # ウィンドウ移動
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # スペシャルワークスペース
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # マウスホイール
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # スクリーンショット
        ", Print, exec, hyprshot -m window --clipboard-only"
        "SHIFT, Print , exec, hyprshot -m window -o $hyprshot"
        "$mainMod, Print, exec, hyprshot -m region --clipboard-only"
        "$mainMod SHIFT, Print, exec, hyprshot -m region -o $hyprshot"
      ];
      # マウスバインド
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
