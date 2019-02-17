{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "andada-sc-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/andadasc/AndadaSC-Regular.ttf?raw=true";
      name = "AndadaSC-Regular.ttf";
      sha256 = "dc2dc4ae6bf7279f8ccde0aef5e49796ead26a396b85cc4e19ded2d39ca0b101";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/andadasc/AndadaSC-Italic.ttf?raw=true";
      name = "AndadaSC-Italic.ttf";
      sha256 = "999623dd5cefa567d93e10e1ee92ac35b772e1714edfe8e3e671c2c7e7012e39";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/andadasc/AndadaSC-Bold.ttf?raw=true";
      name = "AndadaSC-Bold.ttf";
      sha256 = "c18fa623df12a11dd6721b1545bc0c72e16c6d20076c0fac69fddefc2b8be3a0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/andadasc/AndadaSC-BoldItalic.ttf?raw=true";
      name = "AndadaSC-BoldItalic.ttf";
      sha256 = "ebe5578d97af1eb286c24f7e2186e1939db8f5e06dc34c8b7e67bfe40f5e2273";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AndadaSC-Regular.ttf $out/share/fonts/truetype/AndadaSC-Regular.ttf
     install -Dm644 AndadaSC-Italic.ttf $out/share/fonts/truetype/AndadaSC-Italic.ttf
     install -Dm644 AndadaSC-Bold.ttf $out/share/fonts/truetype/AndadaSC-Bold.ttf
     install -Dm644 AndadaSC-BoldItalic.ttf $out/share/fonts/truetype/AndadaSC-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Andada SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
