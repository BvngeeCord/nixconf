{ config, ... }: {
  # Nvidia config for pc's GTX 1650S

  hardware.nvidia = {
    nvidiaSettings = true;
    modesetting.enable = true;
    # # until https://github.com/NVIDIA/open-gpu-kernel-modules/issues/472 is resolved?
    open = true;
    powerManagement = {
      enable = true;
      kernelSuspendNotifier = true;
    };
    moduleParams = {
      nvidia.NVreg_TemporaryFilePath = "/var/tmp";
    };

    # We must use mkDriver because kernelPackages is too old atp.
    # Versions stolen straight from nixpkgs 26.05 nvidia latest
    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "595.71.05";
      sha256_64bit = "sha256-NiA7iWC35JyKQva6H1hjzeNKBek9KyS3mK8G3YRva4I=";
      openSha256 = "sha256-Lfz71QWKM6x/jD2B22SWpUi7/og30HRlXg1kL3EWzEw=";
      settingsSha256 = "sha256-mXnf3jyvznfB3OfKd657rxv0rYHQb/dX/Riw/+N9EKU=";
      persistencedSha256 = "sha256-Z/6IvEEa/XfZ5F5qoSIPvXJLGtscYVqjFxHZaN/M2Ts=";
    };
  };

  # Note: nvidia-vaapi-driver is added automatically with "nvidia" added to videoDrivers
  hardware.graphics.extraPackages = [ ]; # I don't think vaapiVdpau is necessary? Still not sure
  hardware.graphics.extraPackages32 = [ ];

  # necessary for both X and Wayland based apps
  services.xserver.videoDrivers = [ "nvidia" ];
}
