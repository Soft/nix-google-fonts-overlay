{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nosifer-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/nosifer/Nosifer-Regular.ttf?raw=true";
      name = "Nosifer-Regular.ttf";
      sha256 = "09c5ac35e34dc7a397d5f698b703c5640b59cf93d4d343ebae4f16f3859d09b8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Nosifer-Regular.ttf $out/share/fonts/truetype/Nosifer-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Nosifer";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
