{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fruktur-${version}";
  version = "2016-01-21-012856";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/adfe2b6efa9b5e7ba5788d8879e4193c2d9f27cb/ofl/fruktur/Fruktur-Regular.ttf?raw=true";
      name = "Fruktur-Regular.ttf";
      sha256 = "1862da38b1baf7e29c475ccc06d7f1673a208ad65551b7c02674ba7638f15a86";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fruktur-Regular.ttf $out/share/fonts/truetype/Fruktur-Regular.ttf
  '';

  meta = with lib; {
    description = "Fruktur";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
