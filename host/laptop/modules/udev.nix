{ ... }: {
  services.udev.extraRules = ''
    # HDMIの抜き差し検知を安定させるためのルール（必要に応じて）
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{remove}="0"
  '';
}
