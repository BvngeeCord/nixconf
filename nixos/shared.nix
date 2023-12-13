{ pkgs, ... }: {
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    packages = with pkgs; [ terminus_font ];
    earlySetup = true;
    #font = "Lat2-Terminus16";
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v24n.psf.gz";
    keyMap = "us";
  };

  environment.systemPackages = with pkgs; [
    git
    home-manager # TODO: figure out if this is right
  ];
}
