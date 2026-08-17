{
  description = "Flake to configure the settings of my darwin machines.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, ... }@inputs:
    let
      inherit (self) outputs;

      mkDarwinConfiguration = hostname: username:
        nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = {
            inherit inputs outputs hostname username;
          };

          modules = [
            ./hosts/${hostname}
          ];
        };
    in
      {
        darwinConfigurations = {
          "cedar" = mkDarwinConfiguration "cedar" "gwendalbeaumont";
        };
      };
}
