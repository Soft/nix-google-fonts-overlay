{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "share-${version}";
  version = "2017-05-09-185207";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9f59b2e921a54ad05e911323826e4e6fd02b789c/ofl/share/Share-Regular.ttf?raw=true";
      name = "Share-Regular.ttf";
      sha256 = "ef1c3522c12628f19174fbdb2939a2dbd03c83d2498e4a8c0c74c6a4caa9914b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9f59b2e921a54ad05e911323826e4e6fd02b789c/ofl/share/Share-Italic.ttf?raw=true";
      name = "Share-Italic.ttf";
      sha256 = "657d449c3205cd6b072ab8e29dc5fb15c1d8320b111bd43a016852171e0b6892";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9f59b2e921a54ad05e911323826e4e6fd02b789c/ofl/share/Share-Bold.ttf?raw=true";
      name = "Share-Bold.ttf";
      sha256 = "9419ff27f645fe25ae465342d77c82fcd2a3f6b97a7ff09051432e64f2df7581";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9f59b2e921a54ad05e911323826e4e6fd02b789c/ofl/share/Share-BoldItalic.ttf?raw=true";
      name = "Share-BoldItalic.ttf";
      sha256 = "08cc32f8a09bd9ff4336cce6428af68f8fc2140d25535fd10d64ff5244a8ad82";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Share-Regular.ttf $out/share/fonts/truetype/Share-Regular.ttf
     install -Dm644 Share-Italic.ttf $out/share/fonts/truetype/Share-Italic.ttf
     install -Dm644 Share-Bold.ttf $out/share/fonts/truetype/Share-Bold.ttf
     install -Dm644 Share-BoldItalic.ttf $out/share/fonts/truetype/Share-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Share";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
