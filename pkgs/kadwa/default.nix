{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kadwa-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f585e352eb8d45e902272c214c14044dd882f3f/ofl/kadwa/Kadwa-Regular.ttf?raw=true";
      name = "Kadwa-Regular.ttf";
      sha256 = "2d726feadfadcf1e1eb31d443556b830da66badbb0629e984419d8ddab7e6e9d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f585e352eb8d45e902272c214c14044dd882f3f/ofl/kadwa/Kadwa-Bold.ttf?raw=true";
      name = "Kadwa-Bold.ttf";
      sha256 = "4dca4a79280ecc1911deb83cc0441dbd53d65af10a42b07157c7a9f2de1e25cc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kadwa-Regular.ttf $out/share/fonts/truetype/Kadwa-Regular.ttf
     install -Dm644 Kadwa-Bold.ttf $out/share/fonts/truetype/Kadwa-Bold.ttf
  '';

  meta = with lib; {
    description = "Kadwa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
