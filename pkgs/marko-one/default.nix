{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "marko-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/markoone/MarkoOne-Regular.ttf?raw=true";
      name = "MarkoOne-Regular.ttf";
      sha256 = "6514019373dabdb5d91ab3d3d7e97d96a656738c634fbae047dbb8143815395d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MarkoOne-Regular.ttf $out/share/fonts/truetype/MarkoOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Marko One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
