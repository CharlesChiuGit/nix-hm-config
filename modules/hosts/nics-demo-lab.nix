{ base-attr, ... }:
let
  hm = base-attr.home-manager;
  inherit (base-attr)
    nixpkgs
    catppuccin
    hm_ver
    src
    nur
    ;
in
{
  host = hm.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [
        nur.overlays.default
      ];
      config.allowUnfree = true;
    };
    extraSpecialArgs = {
      inherit src;
      roles = [
        "dev-core"
      ];
    };
    modules = [
      "${src}/modules/core.nix"
      catppuccin.homeModules.catppuccin
      {
        home = {
          username = "charles";
          homeDirectory = "/home/charles";
          stateVersion = hm_ver;
          shell.enableZshIntegration = true;
        };
      }
    ];
  };
}
