{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "modak-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/modak/Modak-Regular.ttf?raw=true";
      name = "Modak-Regular.ttf";
      sha256 = "9a96ba056ddcbb7d0c937c52f744ff5d71004a97689b1fd2cdbd678f314db245";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Modak-Regular.ttf $out/share/fonts/truetype/Modak-Regular.ttf
  '';

  meta = with lib; {
    description = "Modak";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
