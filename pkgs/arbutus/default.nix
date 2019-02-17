{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arbutus-${version}";
  version = "2017-08-07-203016";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/703fd66d131c1a44fae64d268cb6e6b01e1fe6d5/ofl/arbutus/Arbutus-Regular.ttf?raw=true";
      name = "Arbutus-Regular.ttf";
      sha256 = "6c86e8b86c9eebcdb963f83b382e5ba92764b34c53cd9dd96a00ec5d3c5acfdb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Arbutus-Regular.ttf $out/share/fonts/truetype/Arbutus-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Arbutus";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
