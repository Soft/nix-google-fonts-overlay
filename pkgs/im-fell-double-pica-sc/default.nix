{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "im-fell-double-pica-sc-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/imfelldoublepicasc/IMFeDPsc28P.ttf?raw=true";
      name = "IMFeDPsc28P.ttf";
      sha256 = "cde1b1e206b36ef2f74ea4b2bf19786d99e93e1c65775b926701e1141726de81";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IMFeDPsc28P.ttf $out/share/fonts/truetype/IMFeDPsc28P.ttf
  '';

  meta = with lib; {
    description = "IM Fell Double Pica SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
