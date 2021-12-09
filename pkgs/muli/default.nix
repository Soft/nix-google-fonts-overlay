{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "muli-${version}";
  version = "2019-01-18-200100";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9aa9e35c4afdff06858bf5b1d98716ba3ae74060/ofl/muli/Muli-Regular.ttf?raw=true";
      name = "Muli-Regular.ttf";
      sha256 = "764b12af6ea23ed1fac3cb9e34d30f648a426e6255a9b254f45da4e95dfe901b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9aa9e35c4afdff06858bf5b1d98716ba3ae74060/ofl/muli/Muli-Italic.ttf?raw=true";
      name = "Muli-Italic.ttf";
      sha256 = "d8d4624d0b54f1af859f1f65552ca9d3c85d10122fc599b6331fc8a9b651a1a7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Muli-Regular.ttf $out/share/fonts/truetype/Muli-Regular.ttf
     install -Dm644 Muli-Italic.ttf $out/share/fonts/truetype/Muli-Italic.ttf
  '';

  meta = with lib; {
    description = "Muli";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
