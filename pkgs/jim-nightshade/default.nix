{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jim-nightshade-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/jimnightshade/JimNightshade-Regular.ttf?raw=true";
      name = "JimNightshade-Regular.ttf";
      sha256 = "ad49a9f652cb1d7ce711d7ccdfb5922e3961f871705e88fb0e5d033e0e707103";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JimNightshade-Regular.ttf $out/share/fonts/truetype/JimNightshade-Regular.ttf
  '';

  meta = with lib; {
    description = "Jim Nightshade";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
