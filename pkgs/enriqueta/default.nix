{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "enriqueta-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/enriqueta/Enriqueta-Regular.ttf?raw=true";
      name = "Enriqueta-Regular.ttf";
      sha256 = "30ae6071b54769053ce2f758726e0708cee8c997f4a86ffcfefacd7932e34602";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/enriqueta/Enriqueta-Bold.ttf?raw=true";
      name = "Enriqueta-Bold.ttf";
      sha256 = "a62e61ffad6ca3cbc8e973f420f52d19a7420ad0ecc286c94e6aaf043e49ea23";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Enriqueta-Regular.ttf $out/share/fonts/truetype/Enriqueta-Regular.ttf
     install -Dm644 Enriqueta-Bold.ttf $out/share/fonts/truetype/Enriqueta-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Enriqueta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
