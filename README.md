# nix-configuration

This repo is a flake that manages the configuration of my NixOS and darwin systems.

## Installation

- Clone the repository

``` sh
git clone git@github.com:GwendalBeaumont/nix-darwin.git ~/nix-configuration
```

- Move the hardware-configuration file

``` sh
mkdir -p ~/nix-configuration/hosts/<hostname> &&  mv /etc/nixos/hardware-configuration.nix ~/nix-configuration/hosts/<hostname>
```

- Delete the `/etc/nixos/` folder

``` sh
rm -rf /etc/nixos/ 
```
