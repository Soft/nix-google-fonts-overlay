{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "marmelad-${version}";
  version = "2016-11-08-144430";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/af2a3aa05c4648cb0ded9602364d9af0518b0317/ofl/marmelad/Marmelad-Regular.ttf?raw=true";
      name = "Marmelad-Regular.ttf";
      sha256 = "9cbc7cd2da0ce8a854fc5c7e2308151d598b3b5eaa11d9fa3f23d63d317f85d4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Marmelad-Regular.ttf $out/share/fonts/truetype/Marmelad-Regular.ttf
  '';

  meta = with lib; {
    description = "Marmelad";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
