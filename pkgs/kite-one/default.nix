{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kite-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/kiteone/KiteOne-Regular.ttf?raw=true";
      name = "KiteOne-Regular.ttf";
      sha256 = "656a36a211326dec6aaee28c376d0cb690aedb7583c37eb3f4967e36832d6a67";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KiteOne-Regular.ttf $out/share/fonts/truetype/KiteOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Kite One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
