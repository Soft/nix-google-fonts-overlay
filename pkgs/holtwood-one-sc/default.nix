{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "holtwood-one-sc-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/holtwoodonesc/HoltwoodOneSC.ttf?raw=true";
      name = "HoltwoodOneSC.ttf";
      sha256 = "d733fb5df2cfa8bca5b1d9bdb258c7a772f77a9ee5b209573402ad1dfd8597aa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HoltwoodOneSC.ttf $out/share/fonts/truetype/HoltwoodOneSC.ttf
  '';

  meta = with lib; {
    description = "Holtwood One SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
