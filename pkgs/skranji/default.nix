{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "skranji-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/skranji/Skranji-Regular.ttf?raw=true";
      name = "Skranji-Regular.ttf";
      sha256 = "75a25bc56f04606dd4e050686831a6587d69a5365e7001bc862b08cf86dd4ea1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/skranji/Skranji-Bold.ttf?raw=true";
      name = "Skranji-Bold.ttf";
      sha256 = "cfe2e3847d4c4d63efb207533539933b1acaaa7ea71e8df86758c01b7de6e9ab";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Skranji-Regular.ttf $out/share/fonts/truetype/Skranji-Regular.ttf
     install -Dm644 Skranji-Bold.ttf $out/share/fonts/truetype/Skranji-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Skranji";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
