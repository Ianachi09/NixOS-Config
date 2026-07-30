{
  description = "My NixOS Flake Configuration";

  inputs = {
    # Change "nixos-unstable" to a specific version like "nixos-26.05" if you prefer stable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # Replace "myhost" with your actual hostname (run 'hostname' in terminal to check)
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # Change if using a different architecture like aarch64-linux
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
