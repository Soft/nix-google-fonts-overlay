{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "angkor-${version}";
  version = "2017-08-07-194046";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/af110f6c074ece1cf6d0e0ed71d3fe35692a9ff8/ofl/angkor/Angkor-Regular.ttf?raw=true";
      name = "Angkor-Regular.ttf";
      sha256 = "b89aa933a08fa13b518d681e4df4c045ff7950948501e9bff34a75ba3fa3980c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Angkor-Regular.ttf $out/share/fonts/truetype/Angkor-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Angkor";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
