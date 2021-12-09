{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "carrois-gothic-sc-${version}";
  version = "2017-05-08-150808";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e57e3eea98260e4c1e1a1fc9f62bba86fd905f88/ofl/carroisgothicsc/CarroisGothicSC-Regular.ttf?raw=true";
      name = "CarroisGothicSC-Regular.ttf";
      sha256 = "3dfc5fe797ab3e04327287d9dbae313847623670417e850d39e24662071f1c98";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CarroisGothicSC-Regular.ttf $out/share/fonts/truetype/CarroisGothicSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Carrois Gothic SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
