{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "poly-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/poly/Poly-Regular.ttf?raw=true";
      name = "Poly-Regular.ttf";
      sha256 = "1e1a8d7991d5f4f22268c967fe6e7f4de2e006c7a70c2d9d3fbd43b5563e9181";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/poly/Poly-Italic.ttf?raw=true";
      name = "Poly-Italic.ttf";
      sha256 = "c83e89d46d98ddab1ad7897df36e93f4889ecce358bd0b1977a70a11c5303823";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Poly-Regular.ttf $out/share/fonts/truetype/Poly-Regular.ttf
     install -Dm644 Poly-Italic.ttf $out/share/fonts/truetype/Poly-Italic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Poly";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
