# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/41736f78-27d1-4f7d-a6d1-c90384a7b6cd";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  boot.initrd.luks.devices."enc".device = "/dev/disk/by-uuid/d8fc12ca-960f-4951-b93c-8c160e596462";

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/41736f78-27d1-4f7d-a6d1-c90384a7b6cd";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/41736f78-27d1-4f7d-a6d1-c90384a7b6cd";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-uuid/41736f78-27d1-4f7d-a6d1-c90384a7b6cd";
      fsType = "btrfs";
      options = [ "subvol=persist" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/41736f78-27d1-4f7d-a6d1-c90384a7b6cd";
      fsType = "btrfs";
      options = [ "subvol=log" "compress=zstd" "noatime" ];
      neededForBoot = true;
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/826C-69F0";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/2fd886c6-e306-4610-b0a0-4ccc64880a44"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
