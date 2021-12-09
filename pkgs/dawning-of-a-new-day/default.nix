{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dawning-of-a-new-day-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/dawningofanewday/DawningofaNewDay.ttf?raw=true";
      name = "DawningofaNewDay.ttf";
      sha256 = "2b2afa623dbb1926e3b026603287b4d15ee05778106e26a7b33ef94d4be29dcb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DawningofaNewDay.ttf $out/share/fonts/truetype/DawningofaNewDay.ttf
  '';

  meta = with lib; {
    description = "Dawning of a New Day";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
