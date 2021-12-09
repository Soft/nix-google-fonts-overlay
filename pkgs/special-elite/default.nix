{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "special-elite-${version}";
  version = "2017-08-07-205600";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0c42307921ce94c085ce191020cde436f8396ec3/apache/specialelite/SpecialElite-Regular.ttf?raw=true";
      name = "SpecialElite-Regular.ttf";
      sha256 = "a776fcb4ceb8bdf03e2967688ebdad42680de5b91a7e62c17e718ae212d14bc4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SpecialElite-Regular.ttf $out/share/fonts/truetype/SpecialElite-Regular.ttf
  '';

  meta = with lib; {
    description = "Special Elite";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
