{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jsmath-cmmi10-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/apache/jsmathcmmi10/jsMath-cmmi10.ttf?raw=true";
      name = "jsMath-cmmi10.ttf";
      sha256 = "f8f569e095af15da561908026353a73fe7d176f276d86bf7f6fee094bae5bc87";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 jsMath-cmmi10.ttf $out/share/fonts/truetype/jsMath-cmmi10.ttf
  '';

  meta = with stdenv.lib; {
    description = "jsMath cmmi10";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
