{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oxygen-${version}";
  version = "2017-05-08-223229";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/71c9d4f236262c3a7410f3d939c12ac1b8da3f62/ofl/oxygen/Oxygen-Light.ttf?raw=true";
      name = "Oxygen-Light.ttf";
      sha256 = "014b444c3073bcf433577cca0aaa177b35ab1b9a46ada562710006cb35128409";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/71c9d4f236262c3a7410f3d939c12ac1b8da3f62/ofl/oxygen/Oxygen-Regular.ttf?raw=true";
      name = "Oxygen-Regular.ttf";
      sha256 = "a328b8fa366bdd94f507ad02e2721ac49cb4257a9ef1e49560b230079386010e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/71c9d4f236262c3a7410f3d939c12ac1b8da3f62/ofl/oxygen/Oxygen-Bold.ttf?raw=true";
      name = "Oxygen-Bold.ttf";
      sha256 = "d86d9a11ad1aa242dbf50d2a2a3295baab2a11349dcf6db5bd28e36036b7f6c0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Oxygen-Light.ttf $out/share/fonts/truetype/Oxygen-Light.ttf
     install -Dm644 Oxygen-Regular.ttf $out/share/fonts/truetype/Oxygen-Regular.ttf
     install -Dm644 Oxygen-Bold.ttf $out/share/fonts/truetype/Oxygen-Bold.ttf
  '';

  meta = with lib; {
    description = "Oxygen";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
