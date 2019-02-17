{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "quantico-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/quantico/Quantico-Regular.ttf?raw=true";
      name = "Quantico-Regular.ttf";
      sha256 = "7f27dfb0658914ac570bf1da36a2527f10eefd41d25a8f9603d52957d61c075d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/quantico/Quantico-Italic.ttf?raw=true";
      name = "Quantico-Italic.ttf";
      sha256 = "e4761fc04d45ac81cb17cc12cc231af666d39b739dba1c1cbceada3ade8be001";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/quantico/Quantico-Bold.ttf?raw=true";
      name = "Quantico-Bold.ttf";
      sha256 = "e3a88a18c85bfa8c08577abb07e3d490e9264fc09c3c690c6de382c8628901ff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/quantico/Quantico-BoldItalic.ttf?raw=true";
      name = "Quantico-BoldItalic.ttf";
      sha256 = "88a44cbc5bd640f4940a3c42b12d42c6020ebcf71197875b8f553894ca4e209c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Quantico-Regular.ttf $out/share/fonts/truetype/Quantico-Regular.ttf
     install -Dm644 Quantico-Italic.ttf $out/share/fonts/truetype/Quantico-Italic.ttf
     install -Dm644 Quantico-Bold.ttf $out/share/fonts/truetype/Quantico-Bold.ttf
     install -Dm644 Quantico-BoldItalic.ttf $out/share/fonts/truetype/Quantico-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Quantico";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
