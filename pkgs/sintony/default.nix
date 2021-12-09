{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sintony-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sintony/Sintony-Regular.ttf?raw=true";
      name = "Sintony-Regular.ttf";
      sha256 = "b1781da0efb28c1668aa0e8b331868a1bb2eef1a02967e01e6a166f3aae34958";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sintony/Sintony-Bold.ttf?raw=true";
      name = "Sintony-Bold.ttf";
      sha256 = "f091d492eb4b5940e30679a204b0e5465b5b35c7a604b3da330e850e93402bef";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sintony-Regular.ttf $out/share/fonts/truetype/Sintony-Regular.ttf
     install -Dm644 Sintony-Bold.ttf $out/share/fonts/truetype/Sintony-Bold.ttf
  '';

  meta = with lib; {
    description = "Sintony";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
