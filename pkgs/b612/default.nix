{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "b612-${version}";
  version = "2018-11-21-133232";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a2d8f0e1eac999649807539d0d2a0290fa14f963/ofl/b612/B612-Regular.ttf?raw=true";
      name = "B612-Regular.ttf";
      sha256 = "a1c850f0e0ecf73c074adf548d687db3edae2e5423da682ca1ea6d82ea193e15";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a2d8f0e1eac999649807539d0d2a0290fa14f963/ofl/b612/B612-Italic.ttf?raw=true";
      name = "B612-Italic.ttf";
      sha256 = "78bea3519b8fdbf5eceb38f3457803d2fe312f64dcda336ea0609be2ba40da39";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a2d8f0e1eac999649807539d0d2a0290fa14f963/ofl/b612/B612-Bold.ttf?raw=true";
      name = "B612-Bold.ttf";
      sha256 = "0e462c669108741cfe96309a5231f1b0e68ffe2a783008d9d4119ee5a7290a98";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a2d8f0e1eac999649807539d0d2a0290fa14f963/ofl/b612/B612-BoldItalic.ttf?raw=true";
      name = "B612-BoldItalic.ttf";
      sha256 = "88a9ef90a4590b70a4a8c8c0024ed4f899d39892c709cb71d7c21178d9ae6dd0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 B612-Regular.ttf $out/share/fonts/truetype/B612-Regular.ttf
     install -Dm644 B612-Italic.ttf $out/share/fonts/truetype/B612-Italic.ttf
     install -Dm644 B612-Bold.ttf $out/share/fonts/truetype/B612-Bold.ttf
     install -Dm644 B612-BoldItalic.ttf $out/share/fonts/truetype/B612-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "B612";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
