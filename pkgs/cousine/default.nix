{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cousine-${version}";
  version = "2017-08-07-194341";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8df7813875fe214d7980c4ba03094077b859f8e/apache/cousine/Cousine-Regular.ttf?raw=true";
      name = "Cousine-Regular.ttf";
      sha256 = "69e1ea59eb770014204e5174f805750f9a793db4a2531e6516b30b7460d470b3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8df7813875fe214d7980c4ba03094077b859f8e/apache/cousine/Cousine-Italic.ttf?raw=true";
      name = "Cousine-Italic.ttf";
      sha256 = "9b2b98e5d389fe74968af2abb440ac4b6fcd24e2a1aba5ed895b0337b6b0b5e6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8df7813875fe214d7980c4ba03094077b859f8e/apache/cousine/Cousine-Bold.ttf?raw=true";
      name = "Cousine-Bold.ttf";
      sha256 = "42d14baaf1802f8edf7659346a8574b41c4c78e264eb81cdb0891ca6686354ce";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8df7813875fe214d7980c4ba03094077b859f8e/apache/cousine/Cousine-BoldItalic.ttf?raw=true";
      name = "Cousine-BoldItalic.ttf";
      sha256 = "ef65b8624e7993977feb9f9ba18f514a1fa9adc4e1c4737c8839574685c188ae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cousine-Regular.ttf $out/share/fonts/truetype/Cousine-Regular.ttf
     install -Dm644 Cousine-Italic.ttf $out/share/fonts/truetype/Cousine-Italic.ttf
     install -Dm644 Cousine-Bold.ttf $out/share/fonts/truetype/Cousine-Bold.ttf
     install -Dm644 Cousine-BoldItalic.ttf $out/share/fonts/truetype/Cousine-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Cousine";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
