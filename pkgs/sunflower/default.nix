{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sunflower-${version}";
  version = "2018-03-16-095518";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/sunflower/Sunflower-Light.ttf?raw=true";
      name = "Sunflower-Light.ttf";
      sha256 = "dd9fb97aa9ec1fdb65e0328513d9c54c114fba41decca1d32a1e1ed992e255c5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5ea1323a545e2f977c19b043cbf4358062cbd7e4/ofl/sunflower/Sunflower-Medium.ttf?raw=true";
      name = "Sunflower-Medium.ttf";
      sha256 = "6e216d6b2f77a850f6b73be25633d09e03385dfa63a3a632f9e7d83a90ea7f79";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/sunflower/Sunflower-Bold.ttf?raw=true";
      name = "Sunflower-Bold.ttf";
      sha256 = "6b033627817f6619433afe82028013dc45a78ff82406b1dbe5b16e1bbc370e0a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sunflower-Light.ttf $out/share/fonts/truetype/Sunflower-Light.ttf
     install -Dm644 Sunflower-Medium.ttf $out/share/fonts/truetype/Sunflower-Medium.ttf
     install -Dm644 Sunflower-Bold.ttf $out/share/fonts/truetype/Sunflower-Bold.ttf
  '';

  meta = with lib; {
    description = "Sunflower";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
