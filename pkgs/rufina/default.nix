{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rufina-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/rufina/Rufina-Regular.ttf?raw=true";
      name = "Rufina-Regular.ttf";
      sha256 = "0b26e1388e827afa7c40e3ec268c85010dda0c759be0a169025509b59b1a4b1c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/rufina/Rufina-Bold.ttf?raw=true";
      name = "Rufina-Bold.ttf";
      sha256 = "6677451f47d8fd528b8607335ad3bae52db34f775559fc3db99dc7281f5805e0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rufina-Regular.ttf $out/share/fonts/truetype/Rufina-Regular.ttf
     install -Dm644 Rufina-Bold.ttf $out/share/fonts/truetype/Rufina-Bold.ttf
  '';

  meta = with lib; {
    description = "Rufina";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
