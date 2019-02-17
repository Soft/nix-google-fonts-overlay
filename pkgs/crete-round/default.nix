{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "crete-round-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/creteround/CreteRound-Regular.ttf?raw=true";
      name = "CreteRound-Regular.ttf";
      sha256 = "2b06ee75c35806b9fab35e054fbb97af98fb6b2419c6105697351dc1a2b306c8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/creteround/CreteRound-Italic.ttf?raw=true";
      name = "CreteRound-Italic.ttf";
      sha256 = "eee412e43d843b89a3170b9c5dbae2ce5da95ff729916d3a2c3441aed3411b42";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CreteRound-Regular.ttf $out/share/fonts/truetype/CreteRound-Regular.ttf
     install -Dm644 CreteRound-Italic.ttf $out/share/fonts/truetype/CreteRound-Italic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Crete Round";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
