{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "trade-winds-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/tradewinds/TradeWinds-Regular.ttf?raw=true";
      name = "TradeWinds-Regular.ttf";
      sha256 = "b8d8ac0be4a262e8473b25b8b7f90d5909c8780648285b3edc44b5dff6341bb0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TradeWinds-Regular.ttf $out/share/fonts/truetype/TradeWinds-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Trade Winds";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
