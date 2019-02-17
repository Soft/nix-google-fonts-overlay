# Nix Google Fonts Overlay 🎁

[![Build Status](https://travis-ci.org/Soft/nix-google-fonts-overlay.svg?branch=master)](https://travis-ci.org/Soft/nix-google-fonts-overlay)

**967 high-quality fonts packaged for Nix**

This [Nix overlay](https://nixos.org) contains individual packages for all the
fonts from the [Google Fonts project](https://github.com/google/fonts). The
packages are automatically generated using
[nix-google-fonts-gen](https://github.com/Soft/nix-google-fonts-gen) tool.
Updated weekly.

## Use in NixOS configuration

To use fonts from this overlay as a part of NixOS configuration, something like
the following can be used:

``` nix
{ config, pkgs, lib, ... }:

let
  fontsOverlay = import (
    builtins.fetchTarball https://github.com/Soft/nix-google-fonts-overlay/archive/master.tar.gz
  );
in
{
  nixpkgs.overlays = [ fontsOverlay ];

  fonts.fonts = with pkgs; [
    google-fonts-eb-garamond
    google-fonts-exo
    google-fonts-lobster
  ];

  ...
}
```

