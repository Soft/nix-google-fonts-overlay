{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rouge-script-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/rougescript/RougeScript-Regular.ttf?raw=true";
      name = "RougeScript-Regular.ttf";
      sha256 = "99de0ca969d9898687305a36f7e6dde6d30806ab7a463ebb4068dd9dd2a54fd6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RougeScript-Regular.ttf $out/share/fonts/truetype/RougeScript-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Rouge Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
