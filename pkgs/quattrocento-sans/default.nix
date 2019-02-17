{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "quattrocento-sans-${version}";
  version = "2016-05-26-000618";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/quattrocentosans/QuattrocentoSans-Regular.ttf?raw=true";
      name = "QuattrocentoSans-Regular.ttf";
      sha256 = "8ee55c4a998c079efce0db96a30520a121d2bb90fe568f6a9e5cef54cc82ad59";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/quattrocentosans/QuattrocentoSans-Italic.ttf?raw=true";
      name = "QuattrocentoSans-Italic.ttf";
      sha256 = "4107f2ad5d4993e764df336df9d6919ce5cf3600c5fc44488e1d724116f99114";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/quattrocentosans/QuattrocentoSans-Bold.ttf?raw=true";
      name = "QuattrocentoSans-Bold.ttf";
      sha256 = "3c5fcbfa0108c6b8d5f182fbba798d838f6be42c0ca6b4b3462e88a275682eb5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/quattrocentosans/QuattrocentoSans-BoldItalic.ttf?raw=true";
      name = "QuattrocentoSans-BoldItalic.ttf";
      sha256 = "f96418eff31cc33e1c68e68103c10310007280dc06b734cbf936584d532ec29e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 QuattrocentoSans-Regular.ttf $out/share/fonts/truetype/QuattrocentoSans-Regular.ttf
     install -Dm644 QuattrocentoSans-Italic.ttf $out/share/fonts/truetype/QuattrocentoSans-Italic.ttf
     install -Dm644 QuattrocentoSans-Bold.ttf $out/share/fonts/truetype/QuattrocentoSans-Bold.ttf
     install -Dm644 QuattrocentoSans-BoldItalic.ttf $out/share/fonts/truetype/QuattrocentoSans-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Quattrocento Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
