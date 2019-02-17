{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "karla-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/karla/Karla-Regular.ttf?raw=true";
      name = "Karla-Regular.ttf";
      sha256 = "e2e0c223601a6a31d42d9a85152169a457938127b07446d26d9e10ddf6084969";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/karla/Karla-Italic.ttf?raw=true";
      name = "Karla-Italic.ttf";
      sha256 = "5319b5b9b6609b2270f0c4cefe191d4af1da366a3faecbc729df23172682d3f0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/karla/Karla-Bold.ttf?raw=true";
      name = "Karla-Bold.ttf";
      sha256 = "6916f29111d92d1b90729c4e207b8f0a766ed1052301808e61ca8b83e994c1ba";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/karla/Karla-BoldItalic.ttf?raw=true";
      name = "Karla-BoldItalic.ttf";
      sha256 = "4e706aa0ebc0002add658353c017bd523781c52cc3adffb032d4136109c390b8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Karla-Regular.ttf $out/share/fonts/truetype/Karla-Regular.ttf
     install -Dm644 Karla-Italic.ttf $out/share/fonts/truetype/Karla-Italic.ttf
     install -Dm644 Karla-Bold.ttf $out/share/fonts/truetype/Karla-Bold.ttf
     install -Dm644 Karla-BoldItalic.ttf $out/share/fonts/truetype/Karla-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Karla";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
