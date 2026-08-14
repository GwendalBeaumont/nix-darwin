{ config, pkgs, username, ... }:

{
  imports = [
    ../configs/git
    ../configs/gpg
  ];

  home = {
    username = "${username}";
    stateVersion = "25.05";
  };

  programs = {
    git.enable = true;
    gpg.enable = true;
  };
}
