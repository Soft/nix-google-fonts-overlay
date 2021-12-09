{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pt-sans-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptsans/PT_Sans-Web-Regular.ttf?raw=true";
      name = "PT_Sans-Web-Regular.ttf";
      sha256 = "9cc831490532009bae2b3ce0d39c62adfc889060beb421593bfd9d2396d0f10a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptsans/PT_Sans-Web-Italic.ttf?raw=true";
      name = "PT_Sans-Web-Italic.ttf";
      sha256 = "5a90fe2d0cd798700935240580bdcc12c0ffc9102c0c7163b3418e13bc21debd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptsans/PT_Sans-Web-Bold.ttf?raw=true";
      name = "PT_Sans-Web-Bold.ttf";
      sha256 = "3128bd5ecf01816e59a23d54c57a7a6b14615b07db53ff277c77376010265b05";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptsans/PT_Sans-Web-BoldItalic.ttf?raw=true";
      name = "PT_Sans-Web-BoldItalic.ttf";
      sha256 = "81ac221cdd02bccfa679c74adb122478e9d092e65a722e31ca11469961483785";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PT_Sans-Web-Regular.ttf $out/share/fonts/truetype/PT_Sans-Web-Regular.ttf
     install -Dm644 PT_Sans-Web-Italic.ttf $out/share/fonts/truetype/PT_Sans-Web-Italic.ttf
     install -Dm644 PT_Sans-Web-Bold.ttf $out/share/fonts/truetype/PT_Sans-Web-Bold.ttf
     install -Dm644 PT_Sans-Web-BoldItalic.ttf $out/share/fonts/truetype/PT_Sans-Web-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "PT Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
