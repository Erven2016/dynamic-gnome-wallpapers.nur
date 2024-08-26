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
    macos-ventura = {
      name = "macos-ventura";
      format = "png";
      hash = "sha256-PjeUvQEtelbAbCF2UQ/v1Py5/5xJ1Y/UWZYC/8LepRk=";
    };
    moon-far-view = {
      name = "moon-far-view";
      format = "png";
      hash = "sha256-m3niNiEy6njnFKCWYrfbEzCXfV+nmd9HPONSzzej3yE=";
    };
    win11-bloom-gradient = {
      name = "win11-bloom-gradient";
      format = "png";
      hash = "sha256-nmX2OUXEkewW7gvWvJ8LTsKRiz4mepF0qCnWEh5l9VU=";
    };
    win11-bloom-ventura = {
      name = "win11-bloom-ventura";
      format = "png";
      hash = "sha256-SaS5anRQHT/QKREDlmT+sjTb000awnkHF7vpKu0OqWs=";
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
