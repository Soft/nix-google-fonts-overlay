{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lobster-two-${version}";
  version = "2016-05-26-000618";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lobstertwo/LobsterTwo-Regular.ttf?raw=true";
      name = "LobsterTwo-Regular.ttf";
      sha256 = "be3d8ce18188bc559de37e4355f5f902b4960a7b65a99efb78c03bb65bb782e6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lobstertwo/LobsterTwo-Italic.ttf?raw=true";
      name = "LobsterTwo-Italic.ttf";
      sha256 = "c727ae1d9e1e166a7c0679fcf79c2ff0c21bc5483ee253fdfee2f5792c0bebd9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lobstertwo/LobsterTwo-Bold.ttf?raw=true";
      name = "LobsterTwo-Bold.ttf";
      sha256 = "5255b383fc8aa432e4e7e5f8005210477c0983370adc6ad6205c9bd2cd1ceb76";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lobstertwo/LobsterTwo-BoldItalic.ttf?raw=true";
      name = "LobsterTwo-BoldItalic.ttf";
      sha256 = "980ee087455f1f0a96fb2ea74bef441a2bf29048e2c739d11683d330cfc19329";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LobsterTwo-Regular.ttf $out/share/fonts/truetype/LobsterTwo-Regular.ttf
     install -Dm644 LobsterTwo-Italic.ttf $out/share/fonts/truetype/LobsterTwo-Italic.ttf
     install -Dm644 LobsterTwo-Bold.ttf $out/share/fonts/truetype/LobsterTwo-Bold.ttf
     install -Dm644 LobsterTwo-BoldItalic.ttf $out/share/fonts/truetype/LobsterTwo-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Lobster Two";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
