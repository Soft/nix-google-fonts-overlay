{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amarante-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/amarante/Amarante-Regular.ttf?raw=true";
      name = "Amarante-Regular.ttf";
      sha256 = "de5eb7cc2b13632fe3f9fedbe4dc34571a76758cfb52b71fdace8fc4a7638a2f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Amarante-Regular.ttf $out/share/fonts/truetype/Amarante-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Amarante";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
