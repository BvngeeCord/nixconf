{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Image, video
    libsForQt5.gwenview
    mpv
    imv
    gimp

    # Office Suite
    onlyoffice-bin
    libreoffice

    # Discord
    #(pkgsUnstable.discord.override {
    #(pkgs.discord.override {
    #  withOpenASAR = false;
    #  withVencord = false;
    #})

    # Misc/Other
    obs-studio
    firefox
    zoom-us
    gnome.gnome-calculator
    libsForQt5.kcalc
    mission-center
    snapshot
  ];
}
