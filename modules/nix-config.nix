{ pkgs, ... }:
{
  nix = {
    package = pkgs.nix;
    checkConfig = true;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      use-xdg-base-directories = true;
      cores = 0;
      max-jobs = 10;
      auto-optimise-store = true;
      warn-dirty = false;
      http-connections = 50;
      trusted-users = "charles";
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d --max-freed $((1 * 1024**3))";
    };
  };
}
