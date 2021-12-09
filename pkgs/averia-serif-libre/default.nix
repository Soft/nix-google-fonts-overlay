{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "averia-serif-libre-${version}";
  version = "2017-08-07-195650";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/463ce0ab22efecdd01ac957ae91e5dcac810fef2/ofl/averiaseriflibre/AveriaSerifLibre-Light.ttf?raw=true";
      name = "AveriaSerifLibre-Light.ttf";
      sha256 = "974986d0a74bb2a888e7fd13e5556388add3ccceeba77c699e43bb3121facf18";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/463ce0ab22efecdd01ac957ae91e5dcac810fef2/ofl/averiaseriflibre/AveriaSerifLibre-LightItalic.ttf?raw=true";
      name = "AveriaSerifLibre-LightItalic.ttf";
      sha256 = "cfd452ad90bddf59b5e20d9e6b623fce176bd7fa4bf53180e95c6ad9d5cb41bc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/463ce0ab22efecdd01ac957ae91e5dcac810fef2/ofl/averiaseriflibre/AveriaSerifLibre-Regular.ttf?raw=true";
      name = "AveriaSerifLibre-Regular.ttf";
      sha256 = "c64545bce66be1d737832337c1188015f9acacc5230ccbeb4ce646a0eaa252da";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/463ce0ab22efecdd01ac957ae91e5dcac810fef2/ofl/averiaseriflibre/AveriaSerifLibre-Italic.ttf?raw=true";
      name = "AveriaSerifLibre-Italic.ttf";
      sha256 = "c532f0f6ab4e98054942f56de25361505c7c7032c393f2b5ce2d8c82c22b2499";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/463ce0ab22efecdd01ac957ae91e5dcac810fef2/ofl/averiaseriflibre/AveriaSerifLibre-Bold.ttf?raw=true";
      name = "AveriaSerifLibre-Bold.ttf";
      sha256 = "a4f49c9df1351b6151969737493446fa1add16ed1a22fa8b9a4aecbdffeb1b3b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/463ce0ab22efecdd01ac957ae91e5dcac810fef2/ofl/averiaseriflibre/AveriaSerifLibre-BoldItalic.ttf?raw=true";
      name = "AveriaSerifLibre-BoldItalic.ttf";
      sha256 = "3f6d6fe8403f2080c63a48db0bf862243c6c28785a133da2a9273906eb064cd6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AveriaSerifLibre-Light.ttf $out/share/fonts/truetype/AveriaSerifLibre-Light.ttf
     install -Dm644 AveriaSerifLibre-LightItalic.ttf $out/share/fonts/truetype/AveriaSerifLibre-LightItalic.ttf
     install -Dm644 AveriaSerifLibre-Regular.ttf $out/share/fonts/truetype/AveriaSerifLibre-Regular.ttf
     install -Dm644 AveriaSerifLibre-Italic.ttf $out/share/fonts/truetype/AveriaSerifLibre-Italic.ttf
     install -Dm644 AveriaSerifLibre-Bold.ttf $out/share/fonts/truetype/AveriaSerifLibre-Bold.ttf
     install -Dm644 AveriaSerifLibre-BoldItalic.ttf $out/share/fonts/truetype/AveriaSerifLibre-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Averia Serif Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
