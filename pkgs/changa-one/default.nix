{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "changa-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/27a1664cc6487f9a58b7382a592f2b3a78536181/ofl/changaone/ChangaOne-Regular.ttf?raw=true";
      name = "ChangaOne-Regular.ttf";
      sha256 = "7ac4d26a3a45b4731904b59cbb8a9cc15b7b70d447fc2b5dda40ef17c5d2e16d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/27a1664cc6487f9a58b7382a592f2b3a78536181/ofl/changaone/ChangaOne-Italic.ttf?raw=true";
      name = "ChangaOne-Italic.ttf";
      sha256 = "b6228f50f720651795c98aa24cf93bf062fee5899084a9e60f115ab3886f5583";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ChangaOne-Regular.ttf $out/share/fonts/truetype/ChangaOne-Regular.ttf
     install -Dm644 ChangaOne-Italic.ttf $out/share/fonts/truetype/ChangaOne-Italic.ttf
  '';

  meta = with lib; {
    description = "Changa One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
