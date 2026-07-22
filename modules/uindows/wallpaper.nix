{
  pkgs,
  inputs,
  ...
}: let
  patternScrollShader = pkgs.writeText "pattern_scroll.frag" ''
    precision mediump float;
    varying vec2 v_texcoord;
    uniform sampler2D tex;
    uniform float time;

    void main() {
        // 背景色: ピンク (#FFC0CB -> vec3(1.0, 0.75, 0.8))
        vec4 bgColor = vec4(1.0, 0.75, 0.8, 1.0);

        // 時間経過に応じてY座標をシフト（下方向へスクロール）
        // 0.05 の値を変更することでスクロール速度を調整可能
        vec2 uv = vec2(v_texcoord.x, fract(v_texcoord.y - time * 0.05));

        // テクスチャ（柄画像）の色を取得
        vec4 fgColor = texture2D(tex, uv);

        // 柄画像のアルファ値（透過度）に基づいて背景（ピンク）と合成
        gl_FragColor = mix(bgColor, fgColor, fgColor.a);
    }
  '';
in {
  imports = [
    inputs.private-themes.homeModules.uindows-wallpaper
  ];
  home.file = {"/home/taitan/.uindows/wallpapers/.keep".text = "";};
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "${pkgs.mpvpaper}/bin/mpvpaper -o \"--glsl-shader=${patternScrollShader} --loop-file=inf\" '*' /home/taitan/.uindows/wallpapers/bg.png"
    ];
  };
}
