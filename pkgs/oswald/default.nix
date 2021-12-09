{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oswald-${version}";
  version = "2019-01-18-150628";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e6298cc84f595a6dda81460c3aebd320924c3833/ofl/oswald/Oswald-Regular.ttf?raw=true";
      name = "Oswald-Regular.ttf";
      sha256 = "f4dbd1617a7528ee73c84761af002234b83a11c95b5882c34070cd9cab119652";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Oswald-Regular.ttf $out/share/fonts/truetype/Oswald-Regular.ttf
  '';

  meta = with lib; {
    description = "Oswald";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
