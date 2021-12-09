{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pathway-gothic-one-${version}";
  version = "2017-05-09-185128";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0c8f24fddd7a2187aec490dc70195911ff13575d/ofl/pathwaygothicone/PathwayGothicOne-Regular.ttf?raw=true";
      name = "PathwayGothicOne-Regular.ttf";
      sha256 = "d838369413c7a164066df40abb29043fabeccf4857ba47d9d1f150ba76ab3440";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PathwayGothicOne-Regular.ttf $out/share/fonts/truetype/PathwayGothicOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Pathway Gothic One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
