{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noticia-text-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/noticiatext/NoticiaText-Regular.ttf?raw=true";
      name = "NoticiaText-Regular.ttf";
      sha256 = "3eb11339e5a6acd7ad8c6d0753b175be2b12f6c5105562d5c43b2dc800d688f8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/noticiatext/NoticiaText-Italic.ttf?raw=true";
      name = "NoticiaText-Italic.ttf";
      sha256 = "29e6acd83e8b24cfdc0d305e0637c96665c7a75985059d70615c65d63c4ff253";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/noticiatext/NoticiaText-Bold.ttf?raw=true";
      name = "NoticiaText-Bold.ttf";
      sha256 = "a9b1c97d67f93d7ad523656b5343a5a806e4b15501a305326770003cd5548b5d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/noticiatext/NoticiaText-BoldItalic.ttf?raw=true";
      name = "NoticiaText-BoldItalic.ttf";
      sha256 = "284e39cd922072e3c40f78340dde2fa26942a873f1e41c14259f635b320f962a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NoticiaText-Regular.ttf $out/share/fonts/truetype/NoticiaText-Regular.ttf
     install -Dm644 NoticiaText-Italic.ttf $out/share/fonts/truetype/NoticiaText-Italic.ttf
     install -Dm644 NoticiaText-Bold.ttf $out/share/fonts/truetype/NoticiaText-Bold.ttf
     install -Dm644 NoticiaText-BoldItalic.ttf $out/share/fonts/truetype/NoticiaText-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Noticia Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
