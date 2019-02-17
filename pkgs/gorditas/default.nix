{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gorditas-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/gorditas/Gorditas-Regular.ttf?raw=true";
      name = "Gorditas-Regular.ttf";
      sha256 = "95543aaa4c3e1dc22b220b29bcbd8618ff744d904ed4c23179ab5a911d554ee0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/gorditas/Gorditas-Bold.ttf?raw=true";
      name = "Gorditas-Bold.ttf";
      sha256 = "26b8259c2f61ef10dfa2a2fe1d1e113dfb241d6f780ce15878d005f86c1465c5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gorditas-Regular.ttf $out/share/fonts/truetype/Gorditas-Regular.ttf
     install -Dm644 Gorditas-Bold.ttf $out/share/fonts/truetype/Gorditas-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Gorditas";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
