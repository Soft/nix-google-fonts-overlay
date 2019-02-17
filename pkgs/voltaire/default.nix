{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "voltaire-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/voltaire/Voltaire-Regular.ttf?raw=true";
      name = "Voltaire-Regular.ttf";
      sha256 = "5764e3b5853a61ab69005f24e7105adccfb77b8b7dee115ca2cf34042916ef32";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Voltaire-Regular.ttf $out/share/fonts/truetype/Voltaire-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Voltaire";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
