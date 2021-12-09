{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "patrick-hand-sc-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/patrickhandsc/PatrickHandSC-Regular.ttf?raw=true";
      name = "PatrickHandSC-Regular.ttf";
      sha256 = "6906ac992051812f7fe1562a14f0f45f4027c169c2120a5af383c81e514daebd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PatrickHandSC-Regular.ttf $out/share/fonts/truetype/PatrickHandSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Patrick Hand SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
