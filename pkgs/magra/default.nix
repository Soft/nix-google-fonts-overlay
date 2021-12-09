{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "magra-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/magra/Magra-Regular.ttf?raw=true";
      name = "Magra-Regular.ttf";
      sha256 = "d4d0fe421d324b3a7886cac4c6c2069f4e671ae1859463f14af1488ad27f215e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/magra/Magra-Bold.ttf?raw=true";
      name = "Magra-Bold.ttf";
      sha256 = "3e991012c290becfeb29943f86391a435b8bbf1fc853dc8399ccbfcce6b56a81";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Magra-Regular.ttf $out/share/fonts/truetype/Magra-Regular.ttf
     install -Dm644 Magra-Bold.ttf $out/share/fonts/truetype/Magra-Bold.ttf
  '';

  meta = with lib; {
    description = "Magra";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
