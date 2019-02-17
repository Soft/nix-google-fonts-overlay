{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "marvel-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/marvel/Marvel-Regular.ttf?raw=true";
      name = "Marvel-Regular.ttf";
      sha256 = "826c418b11e194fc426338aa6da3b7420cbc2a8089d1b785198fe072e7515d10";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/marvel/Marvel-Italic.ttf?raw=true";
      name = "Marvel-Italic.ttf";
      sha256 = "d3595cb5f687e593cefee93027db12783a2701a81dff460a82a6373724c2bbc4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/marvel/Marvel-Bold.ttf?raw=true";
      name = "Marvel-Bold.ttf";
      sha256 = "2f154dc302525d262f3a5930ed69c1ffdbe26ee837cafe9a2cc124b832d2ed9c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/marvel/Marvel-BoldItalic.ttf?raw=true";
      name = "Marvel-BoldItalic.ttf";
      sha256 = "4d1453fd5ce503afe0b16f4ac75e7642f2a007a55baaf589a47ec952ac73bfae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Marvel-Regular.ttf $out/share/fonts/truetype/Marvel-Regular.ttf
     install -Dm644 Marvel-Italic.ttf $out/share/fonts/truetype/Marvel-Italic.ttf
     install -Dm644 Marvel-Bold.ttf $out/share/fonts/truetype/Marvel-Bold.ttf
     install -Dm644 Marvel-BoldItalic.ttf $out/share/fonts/truetype/Marvel-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Marvel";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
