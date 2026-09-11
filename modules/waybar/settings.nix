{...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        width = 48;
        exclusive = true;
        passthrough = false;

        modules-left = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "network"
          "pulseaudio"
          "battery"
          "group/hardware"
          "clock"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = "○";
            active = "●";
            urgent = "!";
          };
        };

        "network" = {
          format-wifi = "🛜";
          format-ethernet = "󰈔 ";
          format-disconnected = "🚫";
          tooltip-format-wifi = "接続  : {ifname} \nSSID  : {essid} \nIP  : {ipaddr} \n周波数  : {frequency} \n通信強度  : {signalStrength}% \n通信速度  : ↑{bandwidthUpBits} ↓{bandwidthDownBits}";
          tooltip-format-ethernet = "接続  : {ifname} \nSSID  : {essid} \nIP  : {ipaddr} \n周波数  : {frequency} \n通信強度  : {signalStrength}% \n通信速度  : ↑{bandwidthUpBits} ↓{bandwidthDownBits}";
          on-click = "kitty -e nmtui";
        };

        "pulseaudio" = {
          format = "{icon}{volume}%";
          format-bluetooth = "{icon}{volume}%";
          format-muted = "🔇";
          format-icons = {
            default = "🔊";
          };
          on-click = "pavucontrol";
        };

        "battery" = {
          interval = 60;
          format = "🔋{capacity}%";
          tooltip-format = "{timeTo}";
          states = {
            "max" = 100;
            "high" = 80;
            "middle" = 50;
            "low" = 20;
            "too_low" = 10;
            "very_low" = 0;
          };
        };

        "group/hardware" = {
          "orientation" = "vertical";
          "modules" = [
            "custom/runcat"
            "memory"
          ];
        };

        "custom/runcat" = {
          "exec" = "polycat";
          "restart-interval" = 1;
          "width" = 30;
        };

        "memory" = {
          "interval" = 1;
          "format" = " ";
          #"tooltip-format" = "Cpu:\n- 使用率: {usage}%\n- 負荷: {load}\n- 平均周波数: {avg_frequency}GHz\nRam:\n- 使用量: {used:0.1f}GiB / {total:0.1f}GiB ({percentage}%)\n- スワップ: {swapUsed:0.1f}GiB / {swapTotal:0.1f}GiB ({swapPercentage}%)";
          "states" = {
            "p0" = 0;
            "p1" = 1;
            "p2" = 2;
            "p3" = 3;
            "p4" = 4;
            "p5" = 5;
            "p6" = 6;
            "p7" = 7;
            "p8" = 8;
            "p9" = 9;
            "p10" = 10;
            "p11" = 11;
            "p12" = 12;
            "p13" = 13;
            "p14" = 14;
            "p15" = 15;
            "p16" = 16;
            "p17" = 17;
            "p18" = 18;
            "p19" = 19;
            "p20" = 20;
            "p21" = 21;
            "p22" = 22;
            "p23" = 23;
            "p24" = 24;
            "p25" = 25;
            "p26" = 26;
            "p27" = 27;
            "p28" = 28;
            "p29" = 29;
            "p30" = 30;
            "p31" = 31;
            "p32" = 32;
            "p33" = 33;
            "p34" = 34;
            "p35" = 35;
            "p36" = 36;
            "p37" = 37;
            "p38" = 38;
            "p39" = 39;
            "p40" = 40;
            "p41" = 41;
            "p42" = 42;
            "p43" = 43;
            "p44" = 44;
            "p45" = 45;
            "p46" = 46;
            "p47" = 47;
            "p48" = 48;
            "p49" = 49;
            "p50" = 50;
            "p51" = 51;
            "p52" = 52;
            "p53" = 53;
            "p54" = 54;
            "p55" = 55;
            "p56" = 56;
            "p57" = 57;
            "p58" = 58;
            "p59" = 59;
            "p60" = 60;
            "p61" = 61;
            "p62" = 62;
            "p63" = 63;
            "p64" = 64;
            "p65" = 65;
            "p66" = 66;
            "p67" = 67;
            "p68" = 68;
            "p69" = 69;
            "p70" = 70;
            "p71" = 71;
            "p72" = 72;
            "p73" = 73;
            "p74" = 74;
            "p75" = 75;
            "p76" = 76;
            "p77" = 77;
            "p78" = 78;
            "p79" = 79;
            "p80" = 80;
            "p81" = 81;
            "p82" = 82;
            "p83" = 83;
            "p84" = 84;
            "p85" = 85;
            "p86" = 86;
            "p87" = 87;
            "p88" = 88;
            "p89" = 89;
            "p90" = 90;
            "p91" = 91;
            "p92" = 92;
            "p93" = 93;
            "p94" = 94;
            "p95" = 95;
            "p96" = 96;
            "p97" = 97;
            "p98" = 98;
            "p99" = 99;
            "p100" = 100;
          };
        };

        "clock" = {
          format = "{:%H:%M\n%m/%d}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
      };
    };
    style = builtins.readFile ./style.css;
  };
}
