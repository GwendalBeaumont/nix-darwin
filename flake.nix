{
  description = "Flake to configure my darwin machines.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, ... }@inputs:
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
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "bak";
                verbose = true;
                users.${username} = ./home/${hostname};

                extraSpecialArgs = {
                  inherit username;
                };
              };
            }
          ];
        };
    in
      {
        darwinConfigurations = {
          "cedar" = mkDarwinConfiguration "cedar" "gwendalbeaumont";
        };
      };
}
