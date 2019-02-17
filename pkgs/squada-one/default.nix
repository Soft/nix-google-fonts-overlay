{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "squada-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/squadaone/SquadaOne-Regular.ttf?raw=true";
      name = "SquadaOne-Regular.ttf";
      sha256 = "5b34a1633dbc48db3835d8a847bc475e6e0267121d3435854729ba4b407a05df";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SquadaOne-Regular.ttf $out/share/fonts/truetype/SquadaOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Squada One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
