{ pkgs, user, ... }: {
  environment.systemPackages = with pkgs; [
    qemu
    virt-manager
    virt-viewer
    libguestfs-with-appliance
    bottles
  ];

  virtualisation.libvirtd = {
    enable = true;
  };

  users.users.${user}.extraGroups = [ "libvirtd" ];
}
