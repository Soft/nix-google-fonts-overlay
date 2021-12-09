{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "trochut-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/trochut/Trochut-Regular.ttf?raw=true";
      name = "Trochut-Regular.ttf";
      sha256 = "720759af046a690bebcc0fee08df6841d564438219ca86544c375b9252a1224e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/trochut/Trochut-Italic.ttf?raw=true";
      name = "Trochut-Italic.ttf";
      sha256 = "4931fa0cd1418dc3dc9e68a2b1a3cae83d03a6a0743bce27e37841aaea2a4682";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/trochut/Trochut-Bold.ttf?raw=true";
      name = "Trochut-Bold.ttf";
      sha256 = "5a9cf2c2525cd56ff866e172a2f18eb2669ea4e9b6238c954da9dadd1386c527";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Trochut-Regular.ttf $out/share/fonts/truetype/Trochut-Regular.ttf
     install -Dm644 Trochut-Italic.ttf $out/share/fonts/truetype/Trochut-Italic.ttf
     install -Dm644 Trochut-Bold.ttf $out/share/fonts/truetype/Trochut-Bold.ttf
  '';

  meta = with lib; {
    description = "Trochut";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
