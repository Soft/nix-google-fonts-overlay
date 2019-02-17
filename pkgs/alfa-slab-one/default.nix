{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alfa-slab-one-${version}";
  version = "2016-12-01-181453";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fb839dd24542f8f1b0678af6f74335553ee8e61a/ofl/alfaslabone/AlfaSlabOne-Regular.ttf?raw=true";
      name = "AlfaSlabOne-Regular.ttf";
      sha256 = "28664afa698a3393bd5a29eec750230a0645c5301d62200e5f2d3a027fb2299d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlfaSlabOne-Regular.ttf $out/share/fonts/truetype/AlfaSlabOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Alfa Slab One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
