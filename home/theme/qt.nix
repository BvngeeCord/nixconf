{ pkgs, ... }:
let
  kvLibadwaita = pkgs.fetchFromGitHub {
    repo = "KvLibadwaita";
    owner = "GabePoel";
    rev = "61f2e0b04937b6d31f0f4641c9c9f1cc3600a723";
    sha256 = "178rcs2xclfq31x9k3l7nda8ypvy12yj8ndhb4bfmhj0cgfv74gb";
  };
  kvLibadwaitaSrc = "${kvLibadwaita.outPath}/src/KvLibadwaita/";
in
{

  qt = {
    enable = true;
    platformTheme = "qtct"; # If I ever switch to Kvantum, set to "qtct"
    style = {
      name = "kvantum";
      # Breeze is the most (only) consistent Qt theme at the moment. However, it only
      # exists for Qt5, leaving Qt6 apps on the default "Fusion," which is ugly af.
      # Not much that can be done about it right now afaik.
      #name = "breeze";
      #package = pkgs.libsForQt5.breeze-qt5;
    };
  };

  xdg.configFile = with builtins; {
    "Kvantum/KvLibadwaita/KvLibadwaita.kvconfig".text = readFile (kvLibadwaitaSrc + "KvLibadwaita.kvconfig");
    "Kvantum/KvLibadwaita/KvLibadwaita.svg".text = readFile (kvLibadwaitaSrc + "KvLibadwaita.svg");
    "Kvantum/KvLibadwaita/KvLibadwaitaDark.kvconfig".text = readFile (kvLibadwaitaSrc + "KvLibadwaitaDark.kvconfig");
    "Kvantum/KvLibadwaita/KvLibadwaitaDark.svg".text = readFile (kvLibadwaitaSrc + "KvLibadwaitaDark.svg");
    # Default Kvantum theme; hopefully this can be controlled at runtime (if I even end up sticking with Kvantum theming)
    "Kvantum/KvLibadwaita/kvantum.kvconfig".text = ''
      [General]
      theme=KvLibadwaitaDark
    '';
  };

  home.sessionVariables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
  };

}
