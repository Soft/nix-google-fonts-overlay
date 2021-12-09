{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pt-serif-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptserif/PT_Serif-Web-Regular.ttf?raw=true";
      name = "PT_Serif-Web-Regular.ttf";
      sha256 = "a4951fade06ff8f09b7673aa81ffb65a8cd409e24d3289a6dc670bc4dda2557a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptserif/PT_Serif-Web-Italic.ttf?raw=true";
      name = "PT_Serif-Web-Italic.ttf";
      sha256 = "f57e95ff9dc85691a3b2e193f2028db36f6663939a46c0fc4f286d618b80b7ce";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptserif/PT_Serif-Web-Bold.ttf?raw=true";
      name = "PT_Serif-Web-Bold.ttf";
      sha256 = "038ba7336bd7ea14f12ad155bed51a4345cac5153275d521dec3ba04021c526e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptserif/PT_Serif-Web-BoldItalic.ttf?raw=true";
      name = "PT_Serif-Web-BoldItalic.ttf";
      sha256 = "f003788ba08981eb0988b3557a6f224a53dab49c20e283e8b74d5af3c466f8be";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PT_Serif-Web-Regular.ttf $out/share/fonts/truetype/PT_Serif-Web-Regular.ttf
     install -Dm644 PT_Serif-Web-Italic.ttf $out/share/fonts/truetype/PT_Serif-Web-Italic.ttf
     install -Dm644 PT_Serif-Web-Bold.ttf $out/share/fonts/truetype/PT_Serif-Web-Bold.ttf
     install -Dm644 PT_Serif-Web-BoldItalic.ttf $out/share/fonts/truetype/PT_Serif-Web-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "PT Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
