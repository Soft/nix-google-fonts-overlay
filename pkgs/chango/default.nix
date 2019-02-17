{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chango-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/chango/Chango-Regular.ttf?raw=true";
      name = "Chango-Regular.ttf";
      sha256 = "3e566f4b881f24198fe1b6525aae970f9200078136e3416abc7ba0272d2f80d9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chango-Regular.ttf $out/share/fonts/truetype/Chango-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Chango";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
