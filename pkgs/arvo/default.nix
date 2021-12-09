{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arvo-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/35244154c985150ae1ff2850c9bd4a1b3200ed23/ofl/arvo/Arvo-Regular.ttf?raw=true";
      name = "Arvo-Regular.ttf";
      sha256 = "414289d440b46a5ebc0a40dd3e63adb253e6f3b15d68a7f6ddc1691d37979394";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d6402317f034601120fa2f7ae476d1316adfa8f/ofl/arvo/Arvo-Italic.ttf?raw=true";
      name = "Arvo-Italic.ttf";
      sha256 = "d644bf55caaa03fd9a23dbaa38018c0d667d71dd70507ebf3e6c9d63d94452c2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/35244154c985150ae1ff2850c9bd4a1b3200ed23/ofl/arvo/Arvo-Bold.ttf?raw=true";
      name = "Arvo-Bold.ttf";
      sha256 = "db735f15dac276decaf787f300bd34be8a6d2fca5b0a1d4c8cd676e418c2ee09";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d6402317f034601120fa2f7ae476d1316adfa8f/ofl/arvo/Arvo-BoldItalic.ttf?raw=true";
      name = "Arvo-BoldItalic.ttf";
      sha256 = "6acdfbbd48ff4fc00cf4cb2a61cd831bfcb00dfd7944bccf6b84b04283ba00f2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Arvo-Regular.ttf $out/share/fonts/truetype/Arvo-Regular.ttf
     install -Dm644 Arvo-Italic.ttf $out/share/fonts/truetype/Arvo-Italic.ttf
     install -Dm644 Arvo-Bold.ttf $out/share/fonts/truetype/Arvo-Bold.ttf
     install -Dm644 Arvo-BoldItalic.ttf $out/share/fonts/truetype/Arvo-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Arvo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
