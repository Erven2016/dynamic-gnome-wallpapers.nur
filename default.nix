# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{
  pkgs ? import <nixpkgs> { },
}:
let
  inherit (pkgs) callPackage;

  meta = {
    macos-sonoma = {
      name = "macos-sonoma";
      format = "png";
      hash = "sha256-AKeaQlven/Y+Jg/AxOCmLH9YlqQJqZj5NM3V29Permo=";
    };

  };
in
{
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  macos-sonoma = callPackage ./wallpapers/build.nix meta.macos-sonoma;
}
