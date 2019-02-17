{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alegreya-${version}";
  version = "2017-10-31-191933";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c6c886e2243f5f4a62abc2b3558b8caab5df87fd/ofl/alegreya/Alegreya-Regular.ttf?raw=true";
      name = "Alegreya-Regular.ttf";
      sha256 = "b2652047d486c44b9da87d5bf0899f989a2423d091e095cd5c03d3f35ce04c0f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c6c886e2243f5f4a62abc2b3558b8caab5df87fd/ofl/alegreya/Alegreya-Italic.ttf?raw=true";
      name = "Alegreya-Italic.ttf";
      sha256 = "b5f8340d36078797780df0a23392a24f4c67c27429303eedee40ffeff111f417";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c6c886e2243f5f4a62abc2b3558b8caab5df87fd/ofl/alegreya/Alegreya-Medium.ttf?raw=true";
      name = "Alegreya-Medium.ttf";
      sha256 = "0100e2c4ba9b82b6e9b92a66fe43c9a31dbfc39468be74ccc69ba07bac8ff097";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c6c886e2243f5f4a62abc2b3558b8caab5df87fd/ofl/alegreya/Alegreya-MediumItalic.ttf?raw=true";
      name = "Alegreya-MediumItalic.ttf";
      sha256 = "27556a7f74d51f86d63118333c1c1f13f82e11141073555a46622f89d3db3dab";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c6c886e2243f5f4a62abc2b3558b8caab5df87fd/ofl/alegreya/Alegreya-Bold.ttf?raw=true";
      name = "Alegreya-Bold.ttf";
      sha256 = "b163d6ae7eca8e5dade4416076eec954ef98ebb331f4b681964d5ff0f0d22174";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c6c886e2243f5f4a62abc2b3558b8caab5df87fd/ofl/alegreya/Alegreya-BoldItalic.ttf?raw=true";
      name = "Alegreya-BoldItalic.ttf";
      sha256 = "c03d1aa4b8e454b3f02053d353550db2263e1bb2ad155b48f77f3b6d60f0d28e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c6c886e2243f5f4a62abc2b3558b8caab5df87fd/ofl/alegreya/Alegreya-ExtraBold.ttf?raw=true";
      name = "Alegreya-ExtraBold.ttf";
      sha256 = "f3f1556c27bf92b53c0c54293cbc9872b98689eb27708139d81d69d93b637ff7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c6c886e2243f5f4a62abc2b3558b8caab5df87fd/ofl/alegreya/Alegreya-ExtraBoldItalic.ttf?raw=true";
      name = "Alegreya-ExtraBoldItalic.ttf";
      sha256 = "95b26ca484441d56bc305b2e2fffde924c077da54232dfdfcec270e4c50cae5c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c6c886e2243f5f4a62abc2b3558b8caab5df87fd/ofl/alegreya/Alegreya-Black.ttf?raw=true";
      name = "Alegreya-Black.ttf";
      sha256 = "becbe4034a8c33322f5bed15c5c28f94aff1b6155a6d01b14212c480586e47cb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c6c886e2243f5f4a62abc2b3558b8caab5df87fd/ofl/alegreya/Alegreya-BlackItalic.ttf?raw=true";
      name = "Alegreya-BlackItalic.ttf";
      sha256 = "dfcbeea98b037ca4fa4fe195db3b86c9de6bee585df14c4a960587637cc6321e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Alegreya-Regular.ttf $out/share/fonts/truetype/Alegreya-Regular.ttf
     install -Dm644 Alegreya-Italic.ttf $out/share/fonts/truetype/Alegreya-Italic.ttf
     install -Dm644 Alegreya-Medium.ttf $out/share/fonts/truetype/Alegreya-Medium.ttf
     install -Dm644 Alegreya-MediumItalic.ttf $out/share/fonts/truetype/Alegreya-MediumItalic.ttf
     install -Dm644 Alegreya-Bold.ttf $out/share/fonts/truetype/Alegreya-Bold.ttf
     install -Dm644 Alegreya-BoldItalic.ttf $out/share/fonts/truetype/Alegreya-BoldItalic.ttf
     install -Dm644 Alegreya-ExtraBold.ttf $out/share/fonts/truetype/Alegreya-ExtraBold.ttf
     install -Dm644 Alegreya-ExtraBoldItalic.ttf $out/share/fonts/truetype/Alegreya-ExtraBoldItalic.ttf
     install -Dm644 Alegreya-Black.ttf $out/share/fonts/truetype/Alegreya-Black.ttf
     install -Dm644 Alegreya-BlackItalic.ttf $out/share/fonts/truetype/Alegreya-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Alegreya";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
