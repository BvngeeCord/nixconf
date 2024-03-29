{ nixpkgs, inputs, ... }:
let
  mkNixosSystem = config:
    let
      nixpkgsConf = { # Not sure why this is needed at all? nixpkgs.nix does the same
        config.allowUnfree = true;
        config.allowUnfreePredicate = _: true;
      };
      pkgs = import nixpkgs ({ inherit (config) system; } // nixpkgsConf);
      pkgsUnstable = import inputs.nixpkgs-unstable ({ inherit (config) system; } // nixpkgsConf);
    in
    nixpkgs.lib.nixosSystem {
      modules = config.modules;
      specialArgs = {
        inherit (config)
          user
          hostname
          isMobile
          locale
          timezone
          flakeRoot
          base16-theme;
        inherit inputs pkgs pkgsUnstable;
      };
    };
  commonGraphicalModules = [
    ../../nixos/nix.nix
    ../../nixos/nixpkgs.nix
    ../../nixos/users.nix
    ../../nixos/greetd.nix
    ../../nixos/desktop.nix

    ../../nixos/wayland
    ../../nixos/x11

    ../../nixos/hardware/printing.nix
    ../../nixos/hardware/backlight.nix
    ../../nixos/hardware/opengl.nix
    ../../nixos/hardware/usb.nix
    ../../nixos/hardware/audio.nix
    ../../nixos/hardware/network.nix
    ../../nixos/hardware/bluetooth.nix
    ../../nixos/hardware/libinput.nix

    ../../nixos/boot/systemd-boot.nix
    ../../nixos/boot/kernel.nix

    ../../nixos/programs/thunar.nix
    ../../nixos/programs/xremap.nix
    ../../nixos/programs/zsh.nix
    ../../nixos/programs/kdeconnect.nix
    ../../nixos/programs/ssh.nix
    ../../nixos/programs/tailscale.nix
  ];
in
{
  "pc" = mkNixosSystem {
    system = "x86_64-linux";
    user = "jack";
    hostname = "pc";
    isMobile = false;
    locale = "en_US.UTF-8";
    timezone = "America/Los_Angeles";
    flakeRoot = "/home/jack/dev/nixconf";
    base16-theme = "gruvbox-material-dark-medium.yaml";
    modules = [
      ./pc/hardware-configuration.nix
      { system.stateVersion = "23.05"; }

      ../../nixos/programs/gaming.nix

      ../../nixos/kde.nix
      ../../nixos/hardware/openrgb.nix
      ../../nixos/hardware/nvidia.nix
      ../../nixos/hardware/virtualization.nix
    ] ++ commonGraphicalModules;
  };

  "latitude" = mkNixosSystem {
    system = "x86_64-linux";
    user = "jack";
    hostname = "latitude";
    isMobile = true;
    locale = "en_US.UTF-8";
    timezone = "America/Los_Angeles";
    flakeRoot = "/home/jack/dev/nixconf";
    base16-theme = "gruvbox-material-dark-medium.yaml";
    modules = [
      ./latitude/hardware-configuration.nix
      { system.stateVersion = "23.05"; }

      ../../nixos/kde.nix
      ../../nixos/hardware/virtualization.nix
    ] ++ commonGraphicalModules;
  };
}
