{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hanalei-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/hanalei/Hanalei-Regular.ttf?raw=true";
      name = "Hanalei-Regular.ttf";
      sha256 = "000ddd2a6be57f52aa41876c2ba71310e2a711f0343c1bdd71e43c9f137000f6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Hanalei-Regular.ttf $out/share/fonts/truetype/Hanalei-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Hanalei";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
