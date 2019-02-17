{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "croissant-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/croissantone/CroissantOne-Regular.ttf?raw=true";
      name = "CroissantOne-Regular.ttf";
      sha256 = "55ccb462d07bab853281e9fd9646f0cc258bfb1ae8ff645f857ba1f921f7f69e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CroissantOne-Regular.ttf $out/share/fonts/truetype/CroissantOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Croissant One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
