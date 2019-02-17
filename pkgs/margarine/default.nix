{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "margarine-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/margarine/Margarine-Regular.ttf?raw=true";
      name = "Margarine-Regular.ttf";
      sha256 = "54043d3d857af45cfe40d243dfcf138bd45f7fb452364a70925989384198d7f3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Margarine-Regular.ttf $out/share/fonts/truetype/Margarine-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Margarine";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
