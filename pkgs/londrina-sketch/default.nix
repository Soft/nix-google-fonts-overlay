{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "londrina-sketch-${version}";
  version = "2017-07-31-221534";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c238df8bf44bfb00fe8cb31dc0d213a3be7defd6/ofl/londrinasketch/LondrinaSketch-Regular.ttf?raw=true";
      name = "LondrinaSketch-Regular.ttf";
      sha256 = "1d3b7beeda7015014412c916e205016ed66d1f8298a97dce0ca3ae2d13271c9f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LondrinaSketch-Regular.ttf $out/share/fonts/truetype/LondrinaSketch-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Londrina Sketch";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
