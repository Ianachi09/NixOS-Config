{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ./desktop.nix
    ];

  system.stateVersion = "26.05"; # NixOS release 

  # Experimental (Flakes)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  boot.kernelPackages = pkgs.linuxPackages_latest; # Kernel (Latest)

  networking.hostName = "nixos"; # Hostname

  networking.networkmanager.enable = true; # Enable networking

  # Localization
  time.timeZone = "Asia/Kuala_Lumpur";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # User account
  users.users."cinnamoroll" = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "Cinnamoroll";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

}
