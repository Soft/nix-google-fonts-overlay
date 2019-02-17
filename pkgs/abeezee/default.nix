{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "abeezee-${version}";
  version = "2017-05-08-145323";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c9c92ddd2942802f7c867450923c4968e1257a62/ofl/abeezee/ABeeZee-Regular.ttf?raw=true";
      name = "ABeeZee-Regular.ttf";
      sha256 = "cc7ed559c4a02905a5631e14e31075c3dfa9f3c92858ee9f8e30168d9cb77c3d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c9c92ddd2942802f7c867450923c4968e1257a62/ofl/abeezee/ABeeZee-Italic.ttf?raw=true";
      name = "ABeeZee-Italic.ttf";
      sha256 = "34c688fa16eca53535df4139d8ee1d4090ef32603338db67ae97600cd04dcbdf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ABeeZee-Regular.ttf $out/share/fonts/truetype/ABeeZee-Regular.ttf
     install -Dm644 ABeeZee-Italic.ttf $out/share/fonts/truetype/ABeeZee-Italic.ttf
  '';

  meta = with stdenv.lib; {
    description = "ABeeZee";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
