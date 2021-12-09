{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vidaloka-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/vidaloka/Vidaloka-Regular.ttf?raw=true";
      name = "Vidaloka-Regular.ttf";
      sha256 = "56d8210544636152b1f34d6cfca3cf22eaaaa141a010112aca3196d75e5b6ff0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Vidaloka-Regular.ttf $out/share/fonts/truetype/Vidaloka-Regular.ttf
  '';

  meta = with lib; {
    description = "Vidaloka";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
