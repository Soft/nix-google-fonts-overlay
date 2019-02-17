{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "just-another-hand-${version}";
  version = "2017-08-07-204409";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a7995c7485a3a0b6dae125b91834ba384e8df0d6/apache/justanotherhand/JustAnotherHand-Regular.ttf?raw=true";
      name = "JustAnotherHand-Regular.ttf";
      sha256 = "f1cd102ebacdb6388c879c9d481d63908ee0d5939a301415a78cdfdc752f79ea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JustAnotherHand-Regular.ttf $out/share/fonts/truetype/JustAnotherHand-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Just Another Hand";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
