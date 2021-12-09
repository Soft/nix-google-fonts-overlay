{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-${version}";
  version = "2017-05-23-171654";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6177da92bf853e779b0e46ec9f0dd301b2726641/ofl/bungee/Bungee-Regular.ttf?raw=true";
      name = "Bungee-Regular.ttf";
      sha256 = "daa5c6ded3f03043ba1db343ba9f90a3fc6479fe47fb0d3e68ddaf54b171fd9c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bungee-Regular.ttf $out/share/fonts/truetype/Bungee-Regular.ttf
  '';

  meta = with lib; {
    description = "Bungee";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
