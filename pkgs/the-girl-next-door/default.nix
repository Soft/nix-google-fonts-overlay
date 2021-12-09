{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "the-girl-next-door-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/thegirlnextdoor/TheGirlNextDoor.ttf?raw=true";
      name = "TheGirlNextDoor.ttf";
      sha256 = "35329e71258e48398643f1f94175aa0c9a8d18bd179918d9ac4f3d497b6557a1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TheGirlNextDoor.ttf $out/share/fonts/truetype/TheGirlNextDoor.ttf
  '';

  meta = with lib; {
    description = "The Girl Next Door";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
