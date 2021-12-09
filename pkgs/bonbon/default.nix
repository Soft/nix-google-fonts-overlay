{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bonbon-${version}";
  version = "2017-08-07-194922";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/153c9f093c6f2c954611ddd1a2480be9e69855fe/ofl/bonbon/Bonbon-Regular.ttf?raw=true";
      name = "Bonbon-Regular.ttf";
      sha256 = "718753f714468e878b2af1c82ec65b68c60ce81732308957c3e90d59bce7ce98";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bonbon-Regular.ttf $out/share/fonts/truetype/Bonbon-Regular.ttf
  '';

  meta = with lib; {
    description = "Bonbon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
