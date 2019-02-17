{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "milonga-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/milonga/Milonga-Regular.ttf?raw=true";
      name = "Milonga-Regular.ttf";
      sha256 = "202ce337fad18b3d542af04e6dbd76a19b47c00c88d15b7555cef54e1818e383";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Milonga-Regular.ttf $out/share/fonts/truetype/Milonga-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Milonga";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
