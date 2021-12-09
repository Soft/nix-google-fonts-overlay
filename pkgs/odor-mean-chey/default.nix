{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "odor-mean-chey-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/odormeanchey/OdorMeanChey.ttf?raw=true";
      name = "OdorMeanChey.ttf";
      sha256 = "d6f88861db4db30dc7ed15251610bc992a27839c86bd559bf5ec9a9c9518c013";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OdorMeanChey.ttf $out/share/fonts/truetype/OdorMeanChey.ttf
  '';

  meta = with lib; {
    description = "Odor Mean Chey";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
