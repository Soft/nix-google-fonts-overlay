{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "unifrakturmaguntia-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/unifrakturmaguntia/UnifrakturMaguntia-Book.ttf?raw=true";
      name = "UnifrakturMaguntia-Book.ttf";
      sha256 = "d64afc0547059dd2e4a78da48bda0aba0a9901be58c7f8c201a8b2b6b4492cc8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 UnifrakturMaguntia-Book.ttf $out/share/fonts/truetype/UnifrakturMaguntia-Book.ttf
  '';

  meta = with stdenv.lib; {
    description = "UnifrakturMaguntia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
