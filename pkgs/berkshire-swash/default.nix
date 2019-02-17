{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "berkshire-swash-${version}";
  version = "2017-08-07-195322";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5e3cf075394685de1139f794ab1235137997e637/ofl/berkshireswash/BerkshireSwash-Regular.ttf?raw=true";
      name = "BerkshireSwash-Regular.ttf";
      sha256 = "f0c80837dc6f32b89b10894a7e39295db4a00ab697cada682a3f5942c342fe00";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BerkshireSwash-Regular.ttf $out/share/fonts/truetype/BerkshireSwash-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Berkshire Swash";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
