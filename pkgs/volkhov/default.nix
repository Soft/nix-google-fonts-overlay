{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "volkhov-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/volkhov/Volkhov-Regular.ttf?raw=true";
      name = "Volkhov-Regular.ttf";
      sha256 = "f8f49e898a4e9df91ac2f3e0d34deb4912d4fe2424831b514de297c8046d58d9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/volkhov/Volkhov-Italic.ttf?raw=true";
      name = "Volkhov-Italic.ttf";
      sha256 = "027360a4bfabcfcf49f95c9f9944b2147cd95c3a72dcb2a66eac7e7ef6e714f1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/volkhov/Volkhov-Bold.ttf?raw=true";
      name = "Volkhov-Bold.ttf";
      sha256 = "ad28a57498198a9336b673cea068582aa443dc72c98a3222552e8392225af646";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/volkhov/Volkhov-BoldItalic.ttf?raw=true";
      name = "Volkhov-BoldItalic.ttf";
      sha256 = "4863ee6fce826ad47bbf68531bbc0cd861a6c832e8a4905ea79de0aa6add05c2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Volkhov-Regular.ttf $out/share/fonts/truetype/Volkhov-Regular.ttf
     install -Dm644 Volkhov-Italic.ttf $out/share/fonts/truetype/Volkhov-Italic.ttf
     install -Dm644 Volkhov-Bold.ttf $out/share/fonts/truetype/Volkhov-Bold.ttf
     install -Dm644 Volkhov-BoldItalic.ttf $out/share/fonts/truetype/Volkhov-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Volkhov";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
