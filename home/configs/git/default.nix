{ inputs, config, lib, pkgs, ... }:

{
  programs.git = {
    settings = {
      user.email = "gwendal.beaumont@gmail.com";
      user.name = "Gwendal Beaumont";

      init = {
        defaultBranch = "main";
      };
    };

    signing = {
      format = "openpgp";
      key = "847D7D2DB3796CB8789644E373692F251579041D";
      signByDefault = true;
    };

    includes = [
      {
        condition = "gitdir:~/Documents/twindevops";
        contents = {
          user = {
            email = "gwendal.beaumont@imt-atlantique.fr";
            name = "Gwendal Beaumont";
            signingKey = "DBF0167B74C46CA84C0D258851F454CFBA3AEA40";
          };
        };
      }
    ];

    ignores = [
      "*.DS_Store"
    ];
  };
}
