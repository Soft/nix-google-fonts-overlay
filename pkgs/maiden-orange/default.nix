{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "maiden-orange-${version}";
  version = "2017-08-07-204335";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f59b595779198f4970e8fd7ad2545526ec567614/apache/maidenorange/MaidenOrange-Regular.ttf?raw=true";
      name = "MaidenOrange-Regular.ttf";
      sha256 = "fd63e44269350a9761db9a88db9a301c82671123c7a9550fa4004b26b5d16200";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MaidenOrange-Regular.ttf $out/share/fonts/truetype/MaidenOrange-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Maiden Orange";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
