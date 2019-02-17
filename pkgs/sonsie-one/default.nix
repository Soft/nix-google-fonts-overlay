{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sonsie-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sonsieone/SonsieOne-Regular.ttf?raw=true";
      name = "SonsieOne-Regular.ttf";
      sha256 = "af927e627f54066390d6433631106defec38541255083ea36e4c4da27dad7525";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SonsieOne-Regular.ttf $out/share/fonts/truetype/SonsieOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Sonsie One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
