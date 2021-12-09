{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rye-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/rye/Rye-Regular.ttf?raw=true";
      name = "Rye-Regular.ttf";
      sha256 = "b7edee5e615ae1b6b07e9d030c1309152bf3672a0e8a2a46293e273730f5adba";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rye-Regular.ttf $out/share/fonts/truetype/Rye-Regular.ttf
  '';

  meta = with lib; {
    description = "Rye";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
