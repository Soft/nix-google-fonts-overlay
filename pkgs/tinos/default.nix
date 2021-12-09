{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tinos-${version}";
  version = "2017-08-07-194444";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8f9756108bfbbdf625e24e6b869ed02465b2a7af/apache/tinos/Tinos-Regular.ttf?raw=true";
      name = "Tinos-Regular.ttf";
      sha256 = "1061395ac6775f3cea27dc9ef3d7a3b9cc34c2b4a2d97aa649411294d5165990";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8f9756108bfbbdf625e24e6b869ed02465b2a7af/apache/tinos/Tinos-Italic.ttf?raw=true";
      name = "Tinos-Italic.ttf";
      sha256 = "751c979043c9641dad389ab9c680c2c9ffb0a0c7352153f48b9ebd958e8963d8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8f9756108bfbbdf625e24e6b869ed02465b2a7af/apache/tinos/Tinos-Bold.ttf?raw=true";
      name = "Tinos-Bold.ttf";
      sha256 = "6a0afe87068ba5ddeb6a9bb7b9d0dc41666966c044767df69de3efb7e33f5af8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8f9756108bfbbdf625e24e6b869ed02465b2a7af/apache/tinos/Tinos-BoldItalic.ttf?raw=true";
      name = "Tinos-BoldItalic.ttf";
      sha256 = "52c4d87a988eb1f1c25e1fcb97970d456a2fb252e0fa2116e2b4bb33e7824bda";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Tinos-Regular.ttf $out/share/fonts/truetype/Tinos-Regular.ttf
     install -Dm644 Tinos-Italic.ttf $out/share/fonts/truetype/Tinos-Italic.ttf
     install -Dm644 Tinos-Bold.ttf $out/share/fonts/truetype/Tinos-Bold.ttf
     install -Dm644 Tinos-BoldItalic.ttf $out/share/fonts/truetype/Tinos-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Tinos";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
