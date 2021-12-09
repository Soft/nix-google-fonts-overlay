{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "norican-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/norican/Norican-Regular.ttf?raw=true";
      name = "Norican-Regular.ttf";
      sha256 = "f8f8988cf7cc2bfa4093c6aa2ff97e4b0e0f3e1e6f64750cc8a94426c646a951";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Norican-Regular.ttf $out/share/fonts/truetype/Norican-Regular.ttf
  '';

  meta = with lib; {
    description = "Norican";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
