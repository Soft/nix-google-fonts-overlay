{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fira-sans-${version}";
  version = "2016-12-02-170953";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-Thin.ttf?raw=true";
      name = "FiraSans-Thin.ttf";
      sha256 = "cd9d582ffae151bc616b26cf84b3c4912d04363b9c5e1b3e599b66e0e7d532a4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-ThinItalic.ttf?raw=true";
      name = "FiraSans-ThinItalic.ttf";
      sha256 = "7275879630990f5bc13a3c3fcd68eea1c902aa8827769de4985390104a71a149";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-ExtraLight.ttf?raw=true";
      name = "FiraSans-ExtraLight.ttf";
      sha256 = "f575442d8b863086599208c9b69d0e345a0936f3ec27b12b3fbc41526b56e838";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-ExtraLightItalic.ttf?raw=true";
      name = "FiraSans-ExtraLightItalic.ttf";
      sha256 = "f4d66af27c828a269d5df483a488404605957d0f4aeead8ebbc9a20dad24b115";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-Light.ttf?raw=true";
      name = "FiraSans-Light.ttf";
      sha256 = "e2172f4a23e9be22f977c34de3897d890401bbc5e9c47df968dfa2c01fb32235";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-LightItalic.ttf?raw=true";
      name = "FiraSans-LightItalic.ttf";
      sha256 = "ca4228bdd77761e229e74e3e30f3a3786a75275b77e675decb75f7d356d7f7b4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-Regular.ttf?raw=true";
      name = "FiraSans-Regular.ttf";
      sha256 = "c29556a2719bf613ef3d5e070e40d903a8965d9c081beca1375dc1e6e0f93c23";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-Italic.ttf?raw=true";
      name = "FiraSans-Italic.ttf";
      sha256 = "a4204f9a8029c1c55daa5385ac95936f74abea3e232770f1fb2862a19d1dfa13";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-Medium.ttf?raw=true";
      name = "FiraSans-Medium.ttf";
      sha256 = "cbc1842cbed8c1d1146ba7c9db97d8f28c9bedfd25f41c5b0e1259ca48622328";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-MediumItalic.ttf?raw=true";
      name = "FiraSans-MediumItalic.ttf";
      sha256 = "d892b7a6e874d839bc7e712b1d57cf64bcf8013ae143c3eab09e0fd9a0604411";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-SemiBold.ttf?raw=true";
      name = "FiraSans-SemiBold.ttf";
      sha256 = "db0321f83eb3e9f527b8af384a1b3fefdc1039cf2b06fd39b3f61492bda9561c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-SemiBoldItalic.ttf?raw=true";
      name = "FiraSans-SemiBoldItalic.ttf";
      sha256 = "97dc5696fe0aabcabf7e041527e0ca39215661cb8174cd1a92c01d9fe224c73d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-Bold.ttf?raw=true";
      name = "FiraSans-Bold.ttf";
      sha256 = "a4d8e149ecdd4874a0726eb0af894488b3b31c423d6b0017c8f415ed1b795b45";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-BoldItalic.ttf?raw=true";
      name = "FiraSans-BoldItalic.ttf";
      sha256 = "1b96c16db9819bcaa9d588068bb397bb6e977c4874965d3d50d789a1943757eb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-ExtraBold.ttf?raw=true";
      name = "FiraSans-ExtraBold.ttf";
      sha256 = "0a26cff904d790f7ade2bffaf227b5fecdbeffdac1695fdbd640e086fe4e7152";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-ExtraBoldItalic.ttf?raw=true";
      name = "FiraSans-ExtraBoldItalic.ttf";
      sha256 = "eb26df1afeec1f817977c8729b4a1ba5ef07d7c821d39cbff6348e491c748f5f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-Black.ttf?raw=true";
      name = "FiraSans-Black.ttf";
      sha256 = "0ab27e9178d7f74898dd26e3a5f10eb7922bb2a88a2903e00796c4f7c7e08cc0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ed7143b8f0c9587f9dcfbcdf5b34ec1a7bc07fca/ofl/firasans/FiraSans-BlackItalic.ttf?raw=true";
      name = "FiraSans-BlackItalic.ttf";
      sha256 = "81bc0f5fac5b1ba562c1625319676e8202fec01b47e1e09b35db88210c30cf68";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FiraSans-Thin.ttf $out/share/fonts/truetype/FiraSans-Thin.ttf
     install -Dm644 FiraSans-ThinItalic.ttf $out/share/fonts/truetype/FiraSans-ThinItalic.ttf
     install -Dm644 FiraSans-ExtraLight.ttf $out/share/fonts/truetype/FiraSans-ExtraLight.ttf
     install -Dm644 FiraSans-ExtraLightItalic.ttf $out/share/fonts/truetype/FiraSans-ExtraLightItalic.ttf
     install -Dm644 FiraSans-Light.ttf $out/share/fonts/truetype/FiraSans-Light.ttf
     install -Dm644 FiraSans-LightItalic.ttf $out/share/fonts/truetype/FiraSans-LightItalic.ttf
     install -Dm644 FiraSans-Regular.ttf $out/share/fonts/truetype/FiraSans-Regular.ttf
     install -Dm644 FiraSans-Italic.ttf $out/share/fonts/truetype/FiraSans-Italic.ttf
     install -Dm644 FiraSans-Medium.ttf $out/share/fonts/truetype/FiraSans-Medium.ttf
     install -Dm644 FiraSans-MediumItalic.ttf $out/share/fonts/truetype/FiraSans-MediumItalic.ttf
     install -Dm644 FiraSans-SemiBold.ttf $out/share/fonts/truetype/FiraSans-SemiBold.ttf
     install -Dm644 FiraSans-SemiBoldItalic.ttf $out/share/fonts/truetype/FiraSans-SemiBoldItalic.ttf
     install -Dm644 FiraSans-Bold.ttf $out/share/fonts/truetype/FiraSans-Bold.ttf
     install -Dm644 FiraSans-BoldItalic.ttf $out/share/fonts/truetype/FiraSans-BoldItalic.ttf
     install -Dm644 FiraSans-ExtraBold.ttf $out/share/fonts/truetype/FiraSans-ExtraBold.ttf
     install -Dm644 FiraSans-ExtraBoldItalic.ttf $out/share/fonts/truetype/FiraSans-ExtraBoldItalic.ttf
     install -Dm644 FiraSans-Black.ttf $out/share/fonts/truetype/FiraSans-Black.ttf
     install -Dm644 FiraSans-BlackItalic.ttf $out/share/fonts/truetype/FiraSans-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Fira Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
