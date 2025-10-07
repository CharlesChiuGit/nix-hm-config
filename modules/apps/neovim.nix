{ pkgs, lib, ... }:
{
  neovim = {
    enable = true;
    # package = pkgs.neovim-nightly;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;
    extraPackages = with pkgs; [
      # Dependent packages used by default plugins
      doq
      cargo
      clang
      cmake
      gcc
      gnumake
      go
      ninja
      pkg-config
      yarn
      lua5_1
      luajitPackages.luarocks-nix
    ];
    extraWrapperArgs = [
      "--suffix"
      "LIBRARY_PATH"
      ":"
      "${lib.makeLibraryPath [
        # manylinux
        pkgs.bzip2
        pkgs.curl
        pkgs.libsodium
        pkgs.libssh
        pkgs.libxml2
        pkgs.openssl
        pkgs.stdenv.cc.cc
        pkgs.stdenv.cc.cc.lib
        pkgs.util-linux
        pkgs.xz
        pkgs.zlib
        pkgs.zstd
        # Packages not included in `nix-ld`'s NixOSModule
        pkgs.glib
        pkgs.libcxx
      ]}"
      "--suffix"
      "PKG_CONFIG_PATH"
      ":"
      "${lib.makeSearchPathOutput "dev" "lib/pkgconfig" [
        # manylinux
        pkgs.bzip2
        pkgs.curl
        pkgs.libsodium
        pkgs.libssh
        pkgs.libxml2
        pkgs.openssl
        pkgs.stdenv.cc.cc
        pkgs.stdenv.cc.cc.lib
        pkgs.util-linux
        pkgs.xz
        pkgs.zlib
        pkgs.zstd
        # Packages not included in `nix-ld`'s NixOSModule
        pkgs.glib
        pkgs.libcxx
      ]}"
    ];
    extraPython3Packages =
      pyPkgs: with pyPkgs; [
        docformatter
        pynvim
      ];
    extraLuaPackages =
      luajitPackages: with luajitPackages; [
        sqlite
        luv
        luasnip
        fzf-lua
        fzy
      ];
  };
}
