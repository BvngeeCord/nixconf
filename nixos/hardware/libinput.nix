{ lib, isMobile, ... }: {
  # For stationary devices (on which I will likely do some gaming), allow
  # mice to click fast. TODO: make the condition more sensible than !isMobile
  environment.etc."libinput/local-overrides.quirks" = lib.mkIf (!isMobile) {
    text = ''
      [Disable Mouse Debounce Protection]
      MatchUdevType=mouse
      ModelBouncingKeys=1
    '';
  };
}
