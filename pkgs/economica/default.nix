{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "economica-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/economica/Economica-Regular.ttf?raw=true";
      name = "Economica-Regular.ttf";
      sha256 = "7d5e3599ef99560f6ecafd0fe41753484ee86f215a7f6c5033c6c07d65b5d7b4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/economica/Economica-Italic.ttf?raw=true";
      name = "Economica-Italic.ttf";
      sha256 = "7524301555913bc0422727b2830d9b6e8269a36433acc825681ed96b40948843";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/economica/Economica-Bold.ttf?raw=true";
      name = "Economica-Bold.ttf";
      sha256 = "b65bd51b7be6bd0df20bf9a652c96afb0ecd7cc1863bd2c3ee8f00e2e29304f4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/economica/Economica-BoldItalic.ttf?raw=true";
      name = "Economica-BoldItalic.ttf";
      sha256 = "00abac86722696edd3e681c71b2eca1df510f54d3f2fbfa0471c8db38190ab43";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Economica-Regular.ttf $out/share/fonts/truetype/Economica-Regular.ttf
     install -Dm644 Economica-Italic.ttf $out/share/fonts/truetype/Economica-Italic.ttf
     install -Dm644 Economica-Bold.ttf $out/share/fonts/truetype/Economica-Bold.ttf
     install -Dm644 Economica-BoldItalic.ttf $out/share/fonts/truetype/Economica-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Economica";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
