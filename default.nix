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
      hash = "sha256-xcJA2XLar4KoJyBjKl4OQM0EoQXtE7s58dWgJMnh5jY=";
      version = "2024.08.00-01";
    };
    macos-ventura = {
      name = "macos-ventura";
      format = "png";
      hash = "sha256-w1wK+DgFte/bmMLFwMI1YJCENNJTWPQ1qX5ks/xctC0";
      version = "2024.08.00-01";
    };
    moon-far-view = {
      name = "moon-far-view";
      format = "png";
      hash = "sha256-TYz32+wRa7NB9DPTpbWVzW8eFvPiprTDCKzFLtWFn6A";
      version = "2024.08.00-01";
    };
    win11-bloom-gradient = {
      name = "win11-bloom-gradient";
      format = "png";
      hash = "sha256-Yn8DKhuS5AOM5J1x1+k3FfmcQak0QIV356qLZNTX4+o=";
      version = "2024.08.00-01";
    };
    win11-bloom-ventura = {
      name = "win11-bloom-ventura";
      format = "png";
      hash = "sha256-XvUwsSD6InF2PHMRIyrVOfmRo8ehWW80MswNHUsscU8=";
      version = "2024.08.00-01";
    };
  };
in
{
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  macos-sonoma = callPackage ./wallpapers/build.nix meta.macos-sonoma;
  macos-ventura = callPackage ./wallpapers/build.nix meta.macos-ventura;
  moon-far-view = callPackage ./wallpapers/build.nix meta.moon-far-view;
  win11-bloom-gradient = callPackage ./wallpapers/build.nix meta.win11-bloom-gradient;
  win11-bloom-ventura = callPackage ./wallpapers/build.nix meta.win11-bloom-ventura;
}
