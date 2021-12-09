{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tuffy-${version}";
  version = "2017-10-25-011636";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ebcdfd2bb7c9169a02679733c626333fdc511e99/ofl/tuffy/Tuffy-Regular.ttf?raw=true";
      name = "Tuffy-Regular.ttf";
      sha256 = "e4818f18c471c4a6a7f1d5f80c7a0ef0fd7b95b63364fd48f15768c449d8f958";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ebcdfd2bb7c9169a02679733c626333fdc511e99/ofl/tuffy/Tuffy-Italic.ttf?raw=true";
      name = "Tuffy-Italic.ttf";
      sha256 = "8b2d94ce0067ce36091c25fe2221368f21bba402cb360fd977339d43bf484e87";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/tuffy/Tuffy-Bold.ttf?raw=true";
      name = "Tuffy-Bold.ttf";
      sha256 = "b7327bb4d996039fb42e7d3cb885bc851cc7683521f1c08b485086cb39aedb5f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/tuffy/Tuffy-BoldItalic.ttf?raw=true";
      name = "Tuffy-BoldItalic.ttf";
      sha256 = "03818734e59d18e9daf66887d275f03481a189291e771ee0b758fa1fc1398a2f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Tuffy-Regular.ttf $out/share/fonts/truetype/Tuffy-Regular.ttf
     install -Dm644 Tuffy-Italic.ttf $out/share/fonts/truetype/Tuffy-Italic.ttf
     install -Dm644 Tuffy-Bold.ttf $out/share/fonts/truetype/Tuffy-Bold.ttf
     install -Dm644 Tuffy-BoldItalic.ttf $out/share/fonts/truetype/Tuffy-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Tuffy";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
