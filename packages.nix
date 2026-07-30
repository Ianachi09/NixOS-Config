{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true; # Allow unfree packages

  # System-wide packages  installed in system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  alacritty
  fuzzel
  pkgs.thunar
  vscode
  firefox
  git
  btop
  waybar
  quickshell
  fastfetch
  pkgs.awww
  ];
  
  # Fonts
  fonts.packages = with pkgs; [
   nerd-fonts.fira-code
  ];

  programs.hyprland = {
   enable = true;
   xwayland.enable = true;
   withUWSM = true;
 };

 programs.fish.enable = true;

 programs.fish.shellAbbrs = {
  sysupdate = "sudo nixos-rebuild switch --flake  ~/.config/nixos";
 };
}