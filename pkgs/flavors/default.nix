{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "flavors-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/flavors/Flavors-Regular.ttf?raw=true";
      name = "Flavors-Regular.ttf";
      sha256 = "dd85071ba3eabb26f80815dff45479874cbb57ee4cada39de67318df22e0fe3f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Flavors-Regular.ttf $out/share/fonts/truetype/Flavors-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Flavors";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
