{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gilda-display-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/gildadisplay/GildaDisplay-Regular.ttf?raw=true";
      name = "GildaDisplay-Regular.ttf";
      sha256 = "9b4b509e6c4a39c610631723b84fe75f7262b03501ffaa032ae575dda628444b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GildaDisplay-Regular.ttf $out/share/fonts/truetype/GildaDisplay-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Gilda Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
