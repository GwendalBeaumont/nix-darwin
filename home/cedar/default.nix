{ config, pkgs, username, ... }:

{
  imports = [
    ../configs/gpg
  ];

  home = {
    username = "${username}";
    stateVersion = "25.05";
  };

  programs = {
    gpg.enable = true;
  };
}
