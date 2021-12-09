{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chicle-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b736f39c3ab7f3f8ad9ac213876cd556185db902/ofl/chicle/Chicle-Regular.ttf?raw=true";
      name = "Chicle-Regular.ttf";
      sha256 = "2c82494b86d3f03821284d60f2209a33218adde0dad7133ce3eb063b4363372b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chicle-Regular.ttf $out/share/fonts/truetype/Chicle-Regular.ttf
  '';

  meta = with lib; {
    description = "Chicle";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
