{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ruda-${version}";
  version = "2017-05-09-185057";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/12992056f1c651c4544b7a8eac8001ede3c20c86/ofl/ruda/Ruda-Regular.ttf?raw=true";
      name = "Ruda-Regular.ttf";
      sha256 = "c7a0254044c8f8ede37e01373fe524b7893743fa048db2e5c8f134bf3895d8c1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/12992056f1c651c4544b7a8eac8001ede3c20c86/ofl/ruda/Ruda-Bold.ttf?raw=true";
      name = "Ruda-Bold.ttf";
      sha256 = "55e06cb3ca75e916d5a7e8cb91a24b847e384fe361f9cd659a246f6ab60ebdb9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/12992056f1c651c4544b7a8eac8001ede3c20c86/ofl/ruda/Ruda-Black.ttf?raw=true";
      name = "Ruda-Black.ttf";
      sha256 = "5f138c41856f9da1ebde4dc7a529df99ae57006bea23d3ed1da64692a8bcd131";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ruda-Regular.ttf $out/share/fonts/truetype/Ruda-Regular.ttf
     install -Dm644 Ruda-Bold.ttf $out/share/fonts/truetype/Ruda-Bold.ttf
     install -Dm644 Ruda-Black.ttf $out/share/fonts/truetype/Ruda-Black.ttf
  '';

  meta = with lib; {
    description = "Ruda";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
