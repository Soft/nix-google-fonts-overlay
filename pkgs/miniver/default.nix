{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "miniver-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/miniver/Miniver-Regular.ttf?raw=true";
      name = "Miniver-Regular.ttf";
      sha256 = "0637ff653a9113189d196434f2055388638083dde397964b83aa2c1800d5b5b7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Miniver-Regular.ttf $out/share/fonts/truetype/Miniver-Regular.ttf
  '';

  meta = with lib; {
    description = "Miniver";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
