{ lib, config, pkgs, ... }: {
  imports = [
    ./hyprland.nix
    ./sway.nix
  ];

  # TODO: these might break x11 sessions. Maybe I should move to compositor specific settings (like Hyprland's env keyword)?
  environment.sessionVariables = {
    _JAVA_AWT_WM_NONEREPARENTING = "1";
    GDK_BACKEND = "wayland,x11";
    SLD_VIDEODRIVER = "wayland";
    QT_QPA_PLATFORM = "wayland;xcb";
    XDG_SESSION_TYPE = "wayland";

    NIXOS_OZONE_WL = "1";

    LIBSEAT_BACKEND = "logind";
  };

  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true; # TODO: improve this section
    # x-d-p-gtk is already added by Gnome; causes an error when duplicated here too
    # TODO: is there a better solution (investigate why the above error happens)?
    extraPortals = lib.optional
      (!config.services.xserver.desktopManager.gnome.enable)
      pkgs.xdg-desktop-portal-gtk;
    config.common = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
    };
  };


  # NOTE: I believe the below is not necessary anymore. Kept here anyways for archival purposes
  # -------------------------------------------------------------------------------------------
  # Replicates `systemctl --user import-environment PATH && systemctl --user restart xdg-desktop-portal.service`
  # which is a temporary fix for the "No Apps available" error when apps try to use the OpenURI portal. Refs:
  # https://github.com/flatpak/xdg-desktop-portal-gtk/issues/440
  # https://github.com/NixOS/nixpkgs/issues/189851
  # https://discourse.nixos.org/t/clicked-links-in-desktop-apps-not-opening-browers/29114/27
  # https://github.com/NixOS/nixpkgs/issues/279434
  #
  # systemd.user.extraConfig = ''
  #   DefaultEnvironment="PATH=/run/wrappers/bin:/etc/profiles/per-user/%u/bin:/nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/per-user/%u/profile/bin:/run/current-system/sw/bin"
  # '';
}
