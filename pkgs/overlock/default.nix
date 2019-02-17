{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "overlock-${version}";
  version = "2017-05-08-223038";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/223736288839a5e1717e2026948fb06a6141ff68/ofl/overlock/Overlock-Regular.ttf?raw=true";
      name = "Overlock-Regular.ttf";
      sha256 = "e27ec26dcb055e6d3843c5106fcacbc54e0c50accc0409935c7aaa16327bc92a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/223736288839a5e1717e2026948fb06a6141ff68/ofl/overlock/Overlock-Italic.ttf?raw=true";
      name = "Overlock-Italic.ttf";
      sha256 = "8602fc83b372d5a09e774054fadee4056a2770e0f3b9000da263d221d0d804a5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/223736288839a5e1717e2026948fb06a6141ff68/ofl/overlock/Overlock-Bold.ttf?raw=true";
      name = "Overlock-Bold.ttf";
      sha256 = "03ac4ce07ebd6e890aaf9071f8c75bf8b7060f39d44335250dd26bcfc8a16329";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/223736288839a5e1717e2026948fb06a6141ff68/ofl/overlock/Overlock-BoldItalic.ttf?raw=true";
      name = "Overlock-BoldItalic.ttf";
      sha256 = "1aa0cf070fc76fde63bc3eb144ed838730abcf33bc65811b0ce9b23adec7691e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/223736288839a5e1717e2026948fb06a6141ff68/ofl/overlock/Overlock-Black.ttf?raw=true";
      name = "Overlock-Black.ttf";
      sha256 = "57e9a9982075e72a7800c0c4c37c4ff2321dcacec5b66622c4a3e114c5d25f7b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/223736288839a5e1717e2026948fb06a6141ff68/ofl/overlock/Overlock-BlackItalic.ttf?raw=true";
      name = "Overlock-BlackItalic.ttf";
      sha256 = "a7de24f86f8170b2f923ace452e2889d74e781f82890e10e8c23135b03cccc91";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Overlock-Regular.ttf $out/share/fonts/truetype/Overlock-Regular.ttf
     install -Dm644 Overlock-Italic.ttf $out/share/fonts/truetype/Overlock-Italic.ttf
     install -Dm644 Overlock-Bold.ttf $out/share/fonts/truetype/Overlock-Bold.ttf
     install -Dm644 Overlock-BoldItalic.ttf $out/share/fonts/truetype/Overlock-BoldItalic.ttf
     install -Dm644 Overlock-Black.ttf $out/share/fonts/truetype/Overlock-Black.ttf
     install -Dm644 Overlock-BlackItalic.ttf $out/share/fonts/truetype/Overlock-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Overlock";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
