{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "geo-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/geo/Geo-Regular.ttf?raw=true";
      name = "Geo-Regular.ttf";
      sha256 = "38669ed77c0ffe1859f45143c63614c0f1953074331536cb35d3caca944be605";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/geo/Geo-Oblique.ttf?raw=true";
      name = "Geo-Oblique.ttf";
      sha256 = "4f0083782a238a2c03fb8864119b1df5c0c8388a208a0f03d7a7c11313e679f3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Geo-Regular.ttf $out/share/fonts/truetype/Geo-Regular.ttf
     install -Dm644 Geo-Oblique.ttf $out/share/fonts/truetype/Geo-Oblique.ttf
  '';

  meta = with stdenv.lib; {
    description = "Geo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
