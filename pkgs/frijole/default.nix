{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "frijole-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/frijole/Frijole-Regular.ttf?raw=true";
      name = "Frijole-Regular.ttf";
      sha256 = "e182bbad0e1ba7eb06d93edb1c97a71f5b7d56e27433fb375f5f7138399ab72c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Frijole-Regular.ttf $out/share/fonts/truetype/Frijole-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Frijole";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
