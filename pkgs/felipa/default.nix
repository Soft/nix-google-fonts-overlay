{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "felipa-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/felipa/Felipa-Regular.ttf?raw=true";
      name = "Felipa-Regular.ttf";
      sha256 = "d3f07e2669e046acc1030139a4b08046d7eca87c0b477a8cc99ac1c46af84edc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Felipa-Regular.ttf $out/share/fonts/truetype/Felipa-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Felipa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
