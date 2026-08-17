{ config, pkgs, hostname, username, ... }:

{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
    optimise.automatic = true;
  };

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
  };

  users.users.${username} = {
    name = "${username}";
    home = "/Users/${username}";
  };

  # Enable TouchID with sudo
  security.pam.services.sudo_local = {
    touchIdAuth = true;
  };

  system = {
    defaults = {
      CustomUserPreferences = {
        NSGlobalDomain."com.apple.mouse.linear" = true;
      };
      NSGlobalDomain = {
        AppleInterfaceStyleSwitchesAutomatically = true;
        AppleShowAllExtensions = true;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
      };
      controlcenter = {
        BatteryShowPercentage = true;
      };
      dock = {
        autohide = true;
        expose-animation-duration = 0.15;
        orientation = "left";
        show-recents = false;
        showhidden = true;
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
      };
      finder = {
        ShowPathbar = true;
        ShowStatusBar = true;
        _FXSortFoldersFirst = true;
      };
      screencapture = {
        location = "~/Pictures/screenshots";
        type = "png";
        disable-shadow = true;
      };
    };

    primaryUser = "${username}";

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 5;
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    git
  ];

  documentation.enable = false;
  system.tools.darwin-uninstaller.enable = false;
}
