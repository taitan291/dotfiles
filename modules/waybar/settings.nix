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
    style = ''
           * {
             border-radius: 0;
             font-family: sans-serif;
             font-size: 11px;
           }

           window#waybar {
             color: #AAB2BF;
             background: rgba(22, 25, 28, 0.9);
             border-bottom: 2px solid #51afef;
           }

           #workspaces button {
             padding: 0 5px;
             color: #AAB2BF;
           }

           #workspaces button.active {
             color: #51afef;
           }

           #network {
             color: #000000;
             font-size: 20px;
             border: 2px solid #ffffff;
             border-radius: 8px;
             margin: 4px 2px;
             min-width: 36px;
             min-height: 36px;
           }

      #network.wifi { background-color: #EFB69F; }
      #network.ethernet { background-color: #f1c40f; }
      #network.disconnected { background-color: #e74c3c; }

           #pulseaudio {
             color: #000000;
             background-color: #DD9FEF;
             border: 2px solid #ffffff;
             border-radius: 8px;
             margin: 4px 2px;
             min-width: 36px;
             min-height: 36px;
           }

           #battery {
             color: #000000;
             background-color: #2d3436;
             border: 2px solid #ffffff;
             border-radius: 8px;
             margin: 4px 2px;
             min-width: 36px;
             min-height: 36px;
           }

           #battery.max { background-color: #43b581; }
           #battery.high { background-color: #57c7ff; }
           #battery.middle { background-color: #ffba57; }
           #battery.low { background-color: #ff6f61; }
           #battery.too_low { background-color: #e3342f; }
           #battery.very_low { background-color: #a93226; }

           #hardware {
             color: #000000;
             background-color: #a0d8ef;
             border: 2px solid #ffffff;
             border-radius: 8px;
             margin: 4px 2px;
             min-width: 36px;
             min-height: 36px;
           }

           #custom-runcat {
             font-size: 20px;
           }

           #memory {
             background: #313244;
             background-clip: content-box;
             padding: 0;
             min-width: 30px;
             min-height: 3px;
             transition: all 0.5s ease;
           }

           #memory.p0 { background: linear-gradient(90deg, #89b4fa 0%, rgba(0,0,0,0) 0%); }
           #memory.p1 { background: linear-gradient(90deg, #89b4fa 1%, rgba(0,0,0,0) 1%); }
           #memory.p2 { background: linear-gradient(90deg, #89b4fa 2%, rgba(0,0,0,0) 2%); }
           #memory.p3 { background: linear-gradient(90deg, #89b4fa 3%, rgba(0,0,0,0) 3%); }
           #memory.p4 { background: linear-gradient(90deg, #89b4fa 4%, rgba(0,0,0,0) 4%); }
           #memory.p5 { background: linear-gradient(90deg, #89b4fa 5%, rgba(0,0,0,0) 5%); }
           #memory.p6 { background: linear-gradient(90deg, #89b4fa 6%, rgba(0,0,0,0) 6%); }
           #memory.p7 { background: linear-gradient(90deg, #89b4fa 7%, rgba(0,0,0,0) 7%); }
           #memory.p8 { background: linear-gradient(90deg, #89b4fa 8%, rgba(0,0,0,0) 8%); }
           #memory.p9 { background: linear-gradient(90deg, #89b4fa 9%, rgba(0,0,0,0) 9%); }

           #memory.p10 { background: linear-gradient(90deg, #89b4fa 10%, rgba(0,0,0,0) 10%); }
           #memory.p11 { background: linear-gradient(90deg, #89b4fa 11%, rgba(0,0,0,0) 11%); }
           #memory.p12 { background: linear-gradient(90deg, #89b4fa 12%, rgba(0,0,0,0) 12%); }
           #memory.p13 { background: linear-gradient(90deg, #89b4fa 13%, rgba(0,0,0,0) 13%); }
           #memory.p14 { background: linear-gradient(90deg, #89b4fa 14%, rgba(0,0,0,0) 14%); }
           #memory.p15 { background: linear-gradient(90deg, #89b4fa 15%, rgba(0,0,0,0) 15%); }
           #memory.p16 { background: linear-gradient(90deg, #89b4fa 16%, rgba(0,0,0,0) 16%); }
           #memory.p17 { background: linear-gradient(90deg, #89b4fa 17%, rgba(0,0,0,0) 17%); }
           #memory.p18 { background: linear-gradient(90deg, #89b4fa 18%, rgba(0,0,0,0) 18%); }
           #memory.p19 { background: linear-gradient(90deg, #89b4fa 19%, rgba(0,0,0,0) 19%); }

           #memory.p20 { background: linear-gradient(90deg, #89b4fa 20%, rgba(0,0,0,0) 20%); }
           #memory.p21 { background: linear-gradient(90deg, #89b4fa 21%, rgba(0,0,0,0) 21%); }
           #memory.p22 { background: linear-gradient(90deg, #89b4fa 22%, rgba(0,0,0,0) 22%); }
           #memory.p23 { background: linear-gradient(90deg, #89b4fa 23%, rgba(0,0,0,0) 23%); }
           #memory.p24 { background: linear-gradient(90deg, #89b4fa 24%, rgba(0,0,0,0) 24%); }
           #memory.p25 { background: linear-gradient(90deg, #89b4fa 25%, rgba(0,0,0,0) 25%); }
           #memory.p26 { background: linear-gradient(90deg, #89b4fa 26%, rgba(0,0,0,0) 26%); }
           #memory.p27 { background: linear-gradient(90deg, #89b4fa 27%, rgba(0,0,0,0) 27%); }
           #memory.p28 { background: linear-gradient(90deg, #89b4fa 28%, rgba(0,0,0,0) 28%); }
           #memory.p29 { background: linear-gradient(90deg, #89b4fa 29%, rgba(0,0,0,0) 29%); }

           #memory.p30 { background: linear-gradient(90deg, #89b4fa 30%, rgba(0,0,0,0) 30%); }
           #memory.p31 { background: linear-gradient(90deg, #89b4fa 31%, rgba(0,0,0,0) 31%); }
           #memory.p32 { background: linear-gradient(90deg, #89b4fa 32%, rgba(0,0,0,0) 32%); }
           #memory.p33 { background: linear-gradient(90deg, #89b4fa 33%, rgba(0,0,0,0) 33%); }
           #memory.p34 { background: linear-gradient(90deg, #89b4fa 34%, rgba(0,0,0,0) 34%); }
           #memory.p35 { background: linear-gradient(90deg, #89b4fa 35%, rgba(0,0,0,0) 35%); }
           #memory.p36 { background: linear-gradient(90deg, #89b4fa 36%, rgba(0,0,0,0) 36%); }
           #memory.p37 { background: linear-gradient(90deg, #89b4fa 37%, rgba(0,0,0,0) 37%); }
           #memory.p38 { background: linear-gradient(90deg, #89b4fa 38%, rgba(0,0,0,0) 38%); }
           #memory.p39 { background: linear-gradient(90deg, #89b4fa 39%, rgba(0,0,0,0) 39%); }

           #memory.p40 { background: linear-gradient(90deg, #89b4fa 40%, rgba(0,0,0,0) 40%); }
           #memory.p41 { background: linear-gradient(90deg, #89b4fa 41%, rgba(0,0,0,0) 41%); }
           #memory.p42 { background: linear-gradient(90deg, #89b4fa 42%, rgba(0,0,0,0) 42%); }
           #memory.p43 { background: linear-gradient(90deg, #89b4fa 43%, rgba(0,0,0,0) 43%); }
           #memory.p44 { background: linear-gradient(90deg, #89b4fa 44%, rgba(0,0,0,0) 44%); }
           #memory.p45 { background: linear-gradient(90deg, #89b4fa 45%, rgba(0,0,0,0) 45%); }
           #memory.p46 { background: linear-gradient(90deg, #89b4fa 46%, rgba(0,0,0,0) 46%); }
           #memory.p47 { background: linear-gradient(90deg, #89b4fa 47%, rgba(0,0,0,0) 47%); }
           #memory.p48 { background: linear-gradient(90deg, #89b4fa 48%, rgba(0,0,0,0) 48%); }
           #memory.p49 { background: linear-gradient(90deg, #89b4fa 49%, rgba(0,0,0,0) 49%); }

           #memory.p50 { background: linear-gradient(90deg, #89b4fa 50%, rgba(0,0,0,0) 50%); }
           #memory.p51 { background: linear-gradient(90deg, #89b4fa 51%, rgba(0,0,0,0) 51%); }
           #memory.p52 { background: linear-gradient(90deg, #89b4fa 52%, rgba(0,0,0,0) 52%); }
           #memory.p53 { background: linear-gradient(90deg, #89b4fa 53%, rgba(0,0,0,0) 53%); }
           #memory.p54 { background: linear-gradient(90deg, #89b4fa 54%, rgba(0,0,0,0) 54%); }
           #memory.p55 { background: linear-gradient(90deg, #89b4fa 55%, rgba(0,0,0,0) 55%); }
           #memory.p56 { background: linear-gradient(90deg, #89b4fa 56%, rgba(0,0,0,0) 56%); }
           #memory.p57 { background: linear-gradient(90deg, #89b4fa 57%, rgba(0,0,0,0) 57%); }
           #memory.p58 { background: linear-gradient(90deg, #89b4fa 58%, rgba(0,0,0,0) 58%); }
           #memory.p59 { background: linear-gradient(90deg, #89b4fa 59%, rgba(0,0,0,0) 59%); }

           #memory.p60 { background: linear-gradient(90deg, #89b4fa 60%, rgba(0,0,0,0) 60%); }
           #memory.p61 { background: linear-gradient(90deg, #89b4fa 61%, rgba(0,0,0,0) 61%); }
           #memory.p62 { background: linear-gradient(90deg, #89b4fa 62%, rgba(0,0,0,0) 62%); }
           #memory.p63 { background: linear-gradient(90deg, #89b4fa 63%, rgba(0,0,0,0) 63%); }
           #memory.p64 { background: linear-gradient(90deg, #89b4fa 64%, rgba(0,0,0,0) 64%); }
           #memory.p65 { background: linear-gradient(90deg, #89b4fa 65%, rgba(0,0,0,0) 65%); }
           #memory.p66 { background: linear-gradient(90deg, #89b4fa 66%, rgba(0,0,0,0) 66%); }
           #memory.p67 { background: linear-gradient(90deg, #89b4fa 67%, rgba(0,0,0,0) 67%); }
           #memory.p68 { background: linear-gradient(90deg, #89b4fa 68%, rgba(0,0,0,0) 68%); }
           #memory.p69 { background: linear-gradient(90deg, #89b4fa 69%, rgba(0,0,0,0) 69%); }

           #memory.p70 { background: linear-gradient(90deg, #89b4fa 70%, rgba(0,0,0,0) 70%); }
           #memory.p71 { background: linear-gradient(90deg, #89b4fa 71%, rgba(0,0,0,0) 71%); }
           #memory.p72 { background: linear-gradient(90deg, #89b4fa 72%, rgba(0,0,0,0) 72%); }
           #memory.p73 { background: linear-gradient(90deg, #89b4fa 73%, rgba(0,0,0,0) 73%); }
           #memory.p74 { background: linear-gradient(90deg, #89b4fa 74%, rgba(0,0,0,0) 74%); }
           #memory.p75 { background: linear-gradient(90deg, #89b4fa 75%, rgba(0,0,0,0) 75%); }
           #memory.p76 { background: linear-gradient(90deg, #89b4fa 76%, rgba(0,0,0,0) 76%); }
           #memory.p77 { background: linear-gradient(90deg, #89b4fa 77%, rgba(0,0,0,0) 77%); }
           #memory.p78 { background: linear-gradient(90deg, #89b4fa 78%, rgba(0,0,0,0) 78%); }
           #memory.p79 { background: linear-gradient(90deg, #89b4fa 79%, rgba(0,0,0,0) 79%); }

           #memory.p80 { background: linear-gradient(90deg, #89b4fa 80%, rgba(0,0,0,0) 80%); }
           #memory.p81 { background: linear-gradient(90deg, #89b4fa 81%, rgba(0,0,0,0) 81%); }
           #memory.p82 { background: linear-gradient(90deg, #89b4fa 82%, rgba(0,0,0,0) 82%); }
           #memory.p83 { background: linear-gradient(90deg, #89b4fa 83%, rgba(0,0,0,0) 83%); }
           #memory.p84 { background: linear-gradient(90deg, #89b4fa 84%, rgba(0,0,0,0) 84%); }
           #memory.p85 { background: linear-gradient(90deg, #89b4fa 85%, rgba(0,0,0,0) 85%); }
           #memory.p86 { background: linear-gradient(90deg, #89b4fa 86%, rgba(0,0,0,0) 86%); }
           #memory.p87 { background: linear-gradient(90deg, #89b4fa 87%, rgba(0,0,0,0) 87%); }
           #memory.p88 { background: linear-gradient(90deg, #89b4fa 88%, rgba(0,0,0,0) 88%); }
           #memory.p89 { background: linear-gradient(90deg, #89b4fa 89%, rgba(0,0,0,0) 89%); }

           #memory.p90 { background: linear-gradient(90deg, #89b4fa 90%, rgba(0,0,0,0) 90%); }
           #memory.p91 { background: linear-gradient(90deg, #89b4fa 91%, rgba(0,0,0,0) 91%); }
           #memory.p92 { background: linear-gradient(90deg, #89b4fa 92%, rgba(0,0,0,0) 92%); }
           #memory.p93 { background: linear-gradient(90deg, #89b4fa 93%, rgba(0,0,0,0) 93%); }
           #memory.p94 { background: linear-gradient(90deg, #89b4fa 94%, rgba(0,0,0,0) 94%); }
           #memory.p95 { background: linear-gradient(90deg, #89b4fa 95%, rgba(0,0,0,0) 95%); }
           #memory.p96 { background: linear-gradient(90deg, #89b4fa 96%, rgba(0,0,0,0) 96%); }
           #memory.p97 { background: linear-gradient(90deg, #89b4fa 97%, rgba(0,0,0,0) 97%); }
           #memory.p98 { background: linear-gradient(90deg, #89b4fa 98%, rgba(0,0,0,0) 98%); }
           #memory.p99 { background: linear-gradient(90deg, #89b4fa 99%, rgba(0,0,0,0) 99%); }

           #memory.p100 { background: linear-gradient(90deg, #89b4fa 100%, rgba(0,0,0,0) 100%); }

           #clock {
             color: #000000;
             background-color: #32ACDC;
             border: 2px solid #ffffff;
             border-radius: 8px;
             margin: 4px 2px;
             min-width: 36px;
             min-height: 36px;
           }
    '';
  };
}
