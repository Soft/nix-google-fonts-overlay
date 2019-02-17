{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "istok-web-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/istokweb/IstokWeb-Regular.ttf?raw=true";
      name = "IstokWeb-Regular.ttf";
      sha256 = "a13c4e6cba8f6d24abf96542d9028cea47411ac65c01e6f85349d7405dee53c6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/istokweb/IstokWeb-Italic.ttf?raw=true";
      name = "IstokWeb-Italic.ttf";
      sha256 = "d8b61729f5d71eb9db7d64573f9003fd893dfb9f6fc8fba5d915eec02ba85283";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/istokweb/IstokWeb-Bold.ttf?raw=true";
      name = "IstokWeb-Bold.ttf";
      sha256 = "e8cae1e9a6e9f452059342547ae8ebf58f04f85c04f59d4383109490fef45d69";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/istokweb/IstokWeb-BoldItalic.ttf?raw=true";
      name = "IstokWeb-BoldItalic.ttf";
      sha256 = "546f1b01644176ccf134b97f74cb4bcc8307abfefb0b06ddf10353dab1296a08";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IstokWeb-Regular.ttf $out/share/fonts/truetype/IstokWeb-Regular.ttf
     install -Dm644 IstokWeb-Italic.ttf $out/share/fonts/truetype/IstokWeb-Italic.ttf
     install -Dm644 IstokWeb-Bold.ttf $out/share/fonts/truetype/IstokWeb-Bold.ttf
     install -Dm644 IstokWeb-BoldItalic.ttf $out/share/fonts/truetype/IstokWeb-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Istok Web";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
