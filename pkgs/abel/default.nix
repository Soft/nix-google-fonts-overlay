{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "abel-${version}";
  version = "2017-05-01-172612";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d3e16741dff4c24a613fcf1c60ce45d4a243b039/ofl/abel/Abel-Regular.ttf?raw=true";
      name = "Abel-Regular.ttf";
      sha256 = "97cf1dbf8f17f42d7799b7725bacbee7d334da8eed29b3bbe3da0fab72a70379";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Abel-Regular.ttf $out/share/fonts/truetype/Abel-Regular.ttf
  '';

  meta = with lib; {
    description = "Abel";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
