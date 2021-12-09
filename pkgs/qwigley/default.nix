{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "qwigley-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/qwigley/Qwigley-Regular.ttf?raw=true";
      name = "Qwigley-Regular.ttf";
      sha256 = "3445b20f9c93fe10123c0de60b0b8d0fe0fbf3c3e66d043a0eb25d46f15eac4d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Qwigley-Regular.ttf $out/share/fonts/truetype/Qwigley-Regular.ttf
  '';

  meta = with lib; {
    description = "Qwigley";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
