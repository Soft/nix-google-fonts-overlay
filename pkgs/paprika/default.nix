{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "paprika-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/paprika/Paprika-Regular.ttf?raw=true";
      name = "Paprika-Regular.ttf";
      sha256 = "9d531f94e4b4ba2e9ccf79026cb2905923a369af8bf14637e1c1436d3854aca8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Paprika-Regular.ttf $out/share/fonts/truetype/Paprika-Regular.ttf
  '';

  meta = with lib; {
    description = "Paprika";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
