{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pt-sans-narrow-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptsansnarrow/PT_Sans-Narrow-Web-Regular.ttf?raw=true";
      name = "PT_Sans-Narrow-Web-Regular.ttf";
      sha256 = "4102edda03059163771869d258df54ac8563c408fa6e9ef75b2ddc85eabea6f4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptsansnarrow/PT_Sans-Narrow-Web-Bold.ttf?raw=true";
      name = "PT_Sans-Narrow-Web-Bold.ttf";
      sha256 = "e69d83bcf5bd647892b4e2b22f5098dabd55c989413513197722fc156fb9f00e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PT_Sans-Narrow-Web-Regular.ttf $out/share/fonts/truetype/PT_Sans-Narrow-Web-Regular.ttf
     install -Dm644 PT_Sans-Narrow-Web-Bold.ttf $out/share/fonts/truetype/PT_Sans-Narrow-Web-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "PT Sans Narrow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
