{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "peralta-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/peralta/Peralta-Regular.ttf?raw=true";
      name = "Peralta-Regular.ttf";
      sha256 = "2bbd48b64ff49ca19148bbc3d6d8595f0262d8cf39809f443528754295c56c2b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Peralta-Regular.ttf $out/share/fonts/truetype/Peralta-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Peralta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
