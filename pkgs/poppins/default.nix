{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "poppins-${version}";
  version = "2018-02-28-203212";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-Thin.ttf?raw=true";
      name = "Poppins-Thin.ttf";
      sha256 = "0f79f3b6913a16504c391f099e0454664dcd238b79d0da7235e9e393ab4e43dc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-ThinItalic.ttf?raw=true";
      name = "Poppins-ThinItalic.ttf";
      sha256 = "db38b1747887a1376594bc2191fdb9150a63e907cf99acacb9e29fe65920aa86";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-ExtraLight.ttf?raw=true";
      name = "Poppins-ExtraLight.ttf";
      sha256 = "a45537b1bb65599e49365b6707b9aa9a0802ae2282d4f759c19f8358e7711ece";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-ExtraLightItalic.ttf?raw=true";
      name = "Poppins-ExtraLightItalic.ttf";
      sha256 = "9c5bbe87a23fe568fc3d3862296ea2e9ed05791d0c1b60dc17aac56de78b99ab";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-Light.ttf?raw=true";
      name = "Poppins-Light.ttf";
      sha256 = "7f02969b4cbfa615d737d159043f1f5a7bd2ce6a8e9c9080e8132a1024528c47";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-LightItalic.ttf?raw=true";
      name = "Poppins-LightItalic.ttf";
      sha256 = "173b7ea9a027274dc41dc77c7b5ddedc9d4eca8bccfd771a0c2f331c14b48e13";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-Regular.ttf?raw=true";
      name = "Poppins-Regular.ttf";
      sha256 = "4bb722fdfadc6ca417a99d2b89ce6743795d1a59a86762962b03dcaf0ea70a2f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-Italic.ttf?raw=true";
      name = "Poppins-Italic.ttf";
      sha256 = "f090292ec602aadd8ff55da97a73135878c0dae19898c9eb11e56b8528616b4a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-Medium.ttf?raw=true";
      name = "Poppins-Medium.ttf";
      sha256 = "af4346521aa9de67c1d965effce8475660171c789e0759febddba2894a8eea64";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-MediumItalic.ttf?raw=true";
      name = "Poppins-MediumItalic.ttf";
      sha256 = "0db51ce4fe216b7d4b929ce58cd0aeb1a69186414258ddb085b281db29c2fa91";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-SemiBold.ttf?raw=true";
      name = "Poppins-SemiBold.ttf";
      sha256 = "29efe1f63af1e1eef1470061f69192f70811797830198b4e10061443fe313802";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-SemiBoldItalic.ttf?raw=true";
      name = "Poppins-SemiBoldItalic.ttf";
      sha256 = "6f63892bfaa40d6484b7058c63e51d3fa80a374f857d08a585e1476492e3ada2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-Bold.ttf?raw=true";
      name = "Poppins-Bold.ttf";
      sha256 = "6b566b380759dd19554228564c6fb2dc01fcf6bfe5cdc5ba28f1ce3b360a9fb5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-BoldItalic.ttf?raw=true";
      name = "Poppins-BoldItalic.ttf";
      sha256 = "44859e9a695350117b29af7044023ffe8e78f7a2843456cea9251cba2ea58cda";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-ExtraBold.ttf?raw=true";
      name = "Poppins-ExtraBold.ttf";
      sha256 = "559bd2dc8e240fa608926e298a41030cff709e6d9e39cc563c045a5fbaf57495";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-ExtraBoldItalic.ttf?raw=true";
      name = "Poppins-ExtraBoldItalic.ttf";
      sha256 = "db8f803d5aaf8e646fd868d0a897ed9997985b88c931bfae3e08c7c8dc2556be";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-Black.ttf?raw=true";
      name = "Poppins-Black.ttf";
      sha256 = "94cfd24cdcbf2bbbb74809dd121ecb5175ee6c438bb6a9a05eca5a70f7121210";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8311edb74d146679a93d79571f038c2c29190a14/ofl/poppins/Poppins-BlackItalic.ttf?raw=true";
      name = "Poppins-BlackItalic.ttf";
      sha256 = "d56d2b8ff884cfae1b637e73a71f3caf1d16cdb5b4acc123d9cd0b5864ca2567";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Poppins-Thin.ttf $out/share/fonts/truetype/Poppins-Thin.ttf
     install -Dm644 Poppins-ThinItalic.ttf $out/share/fonts/truetype/Poppins-ThinItalic.ttf
     install -Dm644 Poppins-ExtraLight.ttf $out/share/fonts/truetype/Poppins-ExtraLight.ttf
     install -Dm644 Poppins-ExtraLightItalic.ttf $out/share/fonts/truetype/Poppins-ExtraLightItalic.ttf
     install -Dm644 Poppins-Light.ttf $out/share/fonts/truetype/Poppins-Light.ttf
     install -Dm644 Poppins-LightItalic.ttf $out/share/fonts/truetype/Poppins-LightItalic.ttf
     install -Dm644 Poppins-Regular.ttf $out/share/fonts/truetype/Poppins-Regular.ttf
     install -Dm644 Poppins-Italic.ttf $out/share/fonts/truetype/Poppins-Italic.ttf
     install -Dm644 Poppins-Medium.ttf $out/share/fonts/truetype/Poppins-Medium.ttf
     install -Dm644 Poppins-MediumItalic.ttf $out/share/fonts/truetype/Poppins-MediumItalic.ttf
     install -Dm644 Poppins-SemiBold.ttf $out/share/fonts/truetype/Poppins-SemiBold.ttf
     install -Dm644 Poppins-SemiBoldItalic.ttf $out/share/fonts/truetype/Poppins-SemiBoldItalic.ttf
     install -Dm644 Poppins-Bold.ttf $out/share/fonts/truetype/Poppins-Bold.ttf
     install -Dm644 Poppins-BoldItalic.ttf $out/share/fonts/truetype/Poppins-BoldItalic.ttf
     install -Dm644 Poppins-ExtraBold.ttf $out/share/fonts/truetype/Poppins-ExtraBold.ttf
     install -Dm644 Poppins-ExtraBoldItalic.ttf $out/share/fonts/truetype/Poppins-ExtraBoldItalic.ttf
     install -Dm644 Poppins-Black.ttf $out/share/fonts/truetype/Poppins-Black.ttf
     install -Dm644 Poppins-BlackItalic.ttf $out/share/fonts/truetype/Poppins-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Poppins";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
