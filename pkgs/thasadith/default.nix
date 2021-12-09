{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "thasadith-${version}";
  version = "2018-09-10-213501";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b79d904719b436509853a386cb90900f896c577b/ofl/thasadith/Thasadith-Regular.ttf?raw=true";
      name = "Thasadith-Regular.ttf";
      sha256 = "82f16de51287233efb2711386542105e4b7d5dbf1d7f460fefa8700b3fcef5eb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b79d904719b436509853a386cb90900f896c577b/ofl/thasadith/Thasadith-Italic.ttf?raw=true";
      name = "Thasadith-Italic.ttf";
      sha256 = "0bf85061df17f275d10dbf600fc98b3c3a7c333927e4c43683eb50a36f063754";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b79d904719b436509853a386cb90900f896c577b/ofl/thasadith/Thasadith-Bold.ttf?raw=true";
      name = "Thasadith-Bold.ttf";
      sha256 = "110accc7df90be398eafe46918bc7b563a34e11ebbaa4fe4047e070a1e14974f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b79d904719b436509853a386cb90900f896c577b/ofl/thasadith/Thasadith-BoldItalic.ttf?raw=true";
      name = "Thasadith-BoldItalic.ttf";
      sha256 = "563858a700b4cbfd3348749e1c9a8e00e030157fdfd538acb6257702303e148b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Thasadith-Regular.ttf $out/share/fonts/truetype/Thasadith-Regular.ttf
     install -Dm644 Thasadith-Italic.ttf $out/share/fonts/truetype/Thasadith-Italic.ttf
     install -Dm644 Thasadith-Bold.ttf $out/share/fonts/truetype/Thasadith-Bold.ttf
     install -Dm644 Thasadith-BoldItalic.ttf $out/share/fonts/truetype/Thasadith-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Thasadith";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
