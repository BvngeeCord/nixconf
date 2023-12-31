{ config, pkgs, ... }: {
  # Change depending on hostname later if necessary

  hardware.nvidia = {
    # until https://github.com/NVIDIA/open-gpu-kernel-modules/issues/472 is resolved?
    open = false;

    # suspend/resume; also adds NVreg_PreserveVideoMemoryAllocations=1 kernel param
    powerManagement.enable = true;

    modesetting.enable = true;
    nvidiaSettings = false; # basically useless software

    # unbearable XWayland flickering on stable/latest due to no explicit sync support
    # https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/967
    package = config.boot.kernelPackages.nvidiaPackages.production; # production => 535
  };

  # no idea if these are necessary. note: nvidia-vaapi-driver is added automatically
  hardware.opengl.extraPackages = [ pkgs.libva ];
  hardware.opengl.extraPackages32 = [ pkgs.pkgsi686Linux.libva ];

  # necessary for both X and Wayland based apps
  services.xserver.videoDrivers = [ "nvidia" ];

  # only necessary on SOME nvidia systems
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
}
