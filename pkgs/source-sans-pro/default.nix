{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "source-sans-pro-${version}";
  version = "2017-05-16-000106";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f1467d58f677b4be9450f2f39f10a600d3846258/ofl/sourcesanspro/SourceSansPro-ExtraLight.ttf?raw=true";
      name = "SourceSansPro-ExtraLight.ttf";
      sha256 = "8315c5b2e847440ce2ce9c233de6b87c568cbf0e611be67e4ebc799e536be978";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f1467d58f677b4be9450f2f39f10a600d3846258/ofl/sourcesanspro/SourceSansPro-ExtraLightItalic.ttf?raw=true";
      name = "SourceSansPro-ExtraLightItalic.ttf";
      sha256 = "fe316e78ae6023af035d6350e0e5f883142189c5bf90883cea040234e77a50eb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f1467d58f677b4be9450f2f39f10a600d3846258/ofl/sourcesanspro/SourceSansPro-Light.ttf?raw=true";
      name = "SourceSansPro-Light.ttf";
      sha256 = "5705ecafdaa64d8af74d0c03f89272a65cfee9f7e62b55016a8dcbe4a69b6f86";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f1467d58f677b4be9450f2f39f10a600d3846258/ofl/sourcesanspro/SourceSansPro-LightItalic.ttf?raw=true";
      name = "SourceSansPro-LightItalic.ttf";
      sha256 = "93ed5542962715b40b4a63779206cd099d1ca865f0ee096a5cddce265be0c356";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f1467d58f677b4be9450f2f39f10a600d3846258/ofl/sourcesanspro/SourceSansPro-Regular.ttf?raw=true";
      name = "SourceSansPro-Regular.ttf";
      sha256 = "71d10a86b4c54a5a9c0c8b467e53ac67d79edb96c956e4e9f65a7074dfb9992a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f1467d58f677b4be9450f2f39f10a600d3846258/ofl/sourcesanspro/SourceSansPro-Italic.ttf?raw=true";
      name = "SourceSansPro-Italic.ttf";
      sha256 = "dac7846e443ec58c0802cd6fa55836060a62d8a7448c0bccff5242bac9e71d0e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c0329fe2714198653d179e5077d6d86d3cb8036a/ofl/sourcesanspro/SourceSansPro-SemiBold.ttf?raw=true";
      name = "SourceSansPro-SemiBold.ttf";
      sha256 = "1abd7bd14daea0c793865e0df0e17b3f07ec1cbf22855676c4716726b930f17e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c0329fe2714198653d179e5077d6d86d3cb8036a/ofl/sourcesanspro/SourceSansPro-SemiBoldItalic.ttf?raw=true";
      name = "SourceSansPro-SemiBoldItalic.ttf";
      sha256 = "f819a0030a22a416cf14cda512e731643faf8d5615e833b57c6f2ac2e316643e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f1467d58f677b4be9450f2f39f10a600d3846258/ofl/sourcesanspro/SourceSansPro-Bold.ttf?raw=true";
      name = "SourceSansPro-Bold.ttf";
      sha256 = "da4f442e66843990825ed4757e27ad3442cad83f9844cc503e8ece85e00f77f2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f1467d58f677b4be9450f2f39f10a600d3846258/ofl/sourcesanspro/SourceSansPro-BoldItalic.ttf?raw=true";
      name = "SourceSansPro-BoldItalic.ttf";
      sha256 = "4413cbf92a508e6a6eb0a089ee9bcf1b94f0b366ea755c5c64b6d4755f160c40";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f1467d58f677b4be9450f2f39f10a600d3846258/ofl/sourcesanspro/SourceSansPro-Black.ttf?raw=true";
      name = "SourceSansPro-Black.ttf";
      sha256 = "0451ace0a903d4f14d1fb67b38508778aceb88af0430962978a8fdba522f2b98";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f1467d58f677b4be9450f2f39f10a600d3846258/ofl/sourcesanspro/SourceSansPro-BlackItalic.ttf?raw=true";
      name = "SourceSansPro-BlackItalic.ttf";
      sha256 = "1ceae12d99691d3f9a4a6a1c914f9e85b0f6be21a118d5477362a96dbc8f3787";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SourceSansPro-ExtraLight.ttf $out/share/fonts/truetype/SourceSansPro-ExtraLight.ttf
     install -Dm644 SourceSansPro-ExtraLightItalic.ttf $out/share/fonts/truetype/SourceSansPro-ExtraLightItalic.ttf
     install -Dm644 SourceSansPro-Light.ttf $out/share/fonts/truetype/SourceSansPro-Light.ttf
     install -Dm644 SourceSansPro-LightItalic.ttf $out/share/fonts/truetype/SourceSansPro-LightItalic.ttf
     install -Dm644 SourceSansPro-Regular.ttf $out/share/fonts/truetype/SourceSansPro-Regular.ttf
     install -Dm644 SourceSansPro-Italic.ttf $out/share/fonts/truetype/SourceSansPro-Italic.ttf
     install -Dm644 SourceSansPro-SemiBold.ttf $out/share/fonts/truetype/SourceSansPro-SemiBold.ttf
     install -Dm644 SourceSansPro-SemiBoldItalic.ttf $out/share/fonts/truetype/SourceSansPro-SemiBoldItalic.ttf
     install -Dm644 SourceSansPro-Bold.ttf $out/share/fonts/truetype/SourceSansPro-Bold.ttf
     install -Dm644 SourceSansPro-BoldItalic.ttf $out/share/fonts/truetype/SourceSansPro-BoldItalic.ttf
     install -Dm644 SourceSansPro-Black.ttf $out/share/fonts/truetype/SourceSansPro-Black.ttf
     install -Dm644 SourceSansPro-BlackItalic.ttf $out/share/fonts/truetype/SourceSansPro-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Source Sans Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
