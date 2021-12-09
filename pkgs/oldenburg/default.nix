{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oldenburg-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/oldenburg/Oldenburg-Regular.ttf?raw=true";
      name = "Oldenburg-Regular.ttf";
      sha256 = "b4f815de562b5fb7881b0338513bfffaf812f6b075d1ade01b75b4d746998823";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Oldenburg-Regular.ttf $out/share/fonts/truetype/Oldenburg-Regular.ttf
  '';

  meta = with lib; {
    description = "Oldenburg";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
