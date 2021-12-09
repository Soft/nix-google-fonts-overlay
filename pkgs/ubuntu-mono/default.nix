{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ubuntu-mono-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ufl/ubuntumono/UbuntuMono-Regular.ttf?raw=true";
      name = "UbuntuMono-Regular.ttf";
      sha256 = "b35dd9d2131d5d83a9b87fe9ad22c6288fa3d17688d43302c14da29812417d63";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ufl/ubuntumono/UbuntuMono-Italic.ttf?raw=true";
      name = "UbuntuMono-Italic.ttf";
      sha256 = "960b2bc286c2ff7d49073303858c65e1fc9013c17a971b61123b02c39454ef75";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ufl/ubuntumono/UbuntuMono-Bold.ttf?raw=true";
      name = "UbuntuMono-Bold.ttf";
      sha256 = "11f15c3a6bbd998a8695fdefb3475931c3789aa035d7546f2efe78e83b352f6b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ufl/ubuntumono/UbuntuMono-BoldItalic.ttf?raw=true";
      name = "UbuntuMono-BoldItalic.ttf";
      sha256 = "bd255784bb87b5c41513a12a86f0f9cf061bce4e8256d3bfe7234611002e8f48";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 UbuntuMono-Regular.ttf $out/share/fonts/truetype/UbuntuMono-Regular.ttf
     install -Dm644 UbuntuMono-Italic.ttf $out/share/fonts/truetype/UbuntuMono-Italic.ttf
     install -Dm644 UbuntuMono-Bold.ttf $out/share/fonts/truetype/UbuntuMono-Bold.ttf
     install -Dm644 UbuntuMono-BoldItalic.ttf $out/share/fonts/truetype/UbuntuMono-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Ubuntu Mono";
    license = licenses.ufl;
    platforms = platforms.all;
  };
}
