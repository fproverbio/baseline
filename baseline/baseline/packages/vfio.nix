{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "amd_iommu=on" "pcie_aspm=off" "pci-stub.ids=10de:1c03,10de:10f1" "iommu=pt" "vfio-pci.ids=10de:1c03,10de:10f1"   "kvm.ignore_msrs=1" "video=efifb:off" "kvm.report_ignored_msrs=0"    ];
  boot.kernelModules = [ "kvm-amd"   "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "amdgpu" "vfio-pci" ];
  boot.initrd.kernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "amdgpu" "vfio-pci" "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" ];
  boot.initrd.preDeviceCommands = ''
  DEVS="0000:0a:00.0 0000:0a:00.1"
  for DEV in $DEVS; do
    echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
  done
  modprobe -i vfio-pci
'';
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = [ ];
  fileSystems."/" = { device = "/dev/disk/by-label/guix"; fsType = "btrfs";};
  fileSystems."/boot" = { device = "/dev/disk/by-uuid/1BFA-1230"; fsType = "vfat";};
  swapDevices = [ ];
  networking.hostName = "datenknecht"; # Define your hostname.
  time.timeZone = "Europe/Amsterdam";
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.eno1.wakeOnLan.enable = true;
  i18n.defaultLocale = "de_DE.UTF-8";
  console = {font = "Lat2-Terminus16"; keyMap = "de";};
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  users.users.sven = {
    isNormalUser = true;
    extraGroups = [ "serial" "usb" "bluetooth" "platformio" "udev" "scanner" "blueman" "syncthing" "dialout" "lp" "audio" "input" "video" "wheel" "libvirtd" "docker" "plugdev"];
  };
  environment.systemPackages = with pkgs; [
    curl wget tmux OVMF openssh udiskie exfat atool pciutils virtmanager neovim
  ];
  programs.sway = {
    enable = true;
    wrapperFeatures = { gtk = true; base = true; };
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu.ovmf.enable = true;
    qemu.package = pkgs.qemu_kvm;
    qemu.runAsRoot = true;
    onBoot = "ignore";
    onShutdown = "shutdown";
  };
  services.openssh.enable = true;
  services.xserver.enable = false;
  services.udev.extraRules = ''SUBSYSTEM=="vfio", OWNER="root", GROUP="kvm" '';
  boot.blacklistedKernelModules = [ "nvidia" "nouveau" ];
  fonts.fonts = with pkgs; [
    noto-fonts
    proggyfonts
    font-awesome
  ];
  services.getty.autologinUser = "sven";
  security.sudo.wheelNeedsPassword = false;

  services.openssh.permitRootLogin = "yes";
  networking.firewall.enable = false;
  system.stateVersion = "21.05"; # Did you read the comment?
}