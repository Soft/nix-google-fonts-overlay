{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sarabun-${version}";
  version = "2018-09-07-135731";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-Thin.ttf?raw=true";
      name = "Sarabun-Thin.ttf";
      sha256 = "fa55eab332e998acb4bb64c43d9bd1cef791d88d5d15d63570f43741688d7057";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-ThinItalic.ttf?raw=true";
      name = "Sarabun-ThinItalic.ttf";
      sha256 = "c520d004674d257f4e539926c04ec9b77cbab2239aaa2b468df9693a369bb884";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-ExtraLight.ttf?raw=true";
      name = "Sarabun-ExtraLight.ttf";
      sha256 = "8aa9fba8885554545c7bce3f1db5efd914c74c0ce8ae58e9e4cb477b5824fe9d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-ExtraLightItalic.ttf?raw=true";
      name = "Sarabun-ExtraLightItalic.ttf";
      sha256 = "c2da92eae4674589bfb7ec04ecb5041c0bbe7768adf65fdddcfc1c9af3bbbb2f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-Light.ttf?raw=true";
      name = "Sarabun-Light.ttf";
      sha256 = "9efd75e5ebb6d7755cca3faa5906c77a4bbd39c9aac0ed23bf7f4ba33b02f688";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-LightItalic.ttf?raw=true";
      name = "Sarabun-LightItalic.ttf";
      sha256 = "50c12a64ff7fb67fa7ca525c2ed2def9660c97c3ca443acea622e35beee97c33";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-Regular.ttf?raw=true";
      name = "Sarabun-Regular.ttf";
      sha256 = "226d4f368fbc0457990ddef2692679badfd2c1a4e89e5ac4d43c10ba7743b2f1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-Italic.ttf?raw=true";
      name = "Sarabun-Italic.ttf";
      sha256 = "595a968e97a8b8179a6bde2d74d4f91b11475dcfb6cf270037d76d8ed71160ea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-Medium.ttf?raw=true";
      name = "Sarabun-Medium.ttf";
      sha256 = "cc7c3016daab3321674fdf6e2ef59850dc0c07503de1cbdb8b90fe8080ada2b4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-MediumItalic.ttf?raw=true";
      name = "Sarabun-MediumItalic.ttf";
      sha256 = "263e6bb51d80c228c201a0770e6100181115119fdca7968445d44d2fb94ab009";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-SemiBold.ttf?raw=true";
      name = "Sarabun-SemiBold.ttf";
      sha256 = "c0bb057d86e4a12097d701ac0953597e315788d47a446f5b63a6604ab21dceba";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-SemiBoldItalic.ttf?raw=true";
      name = "Sarabun-SemiBoldItalic.ttf";
      sha256 = "982bd56d4683c60e7e4c9cd84bfafae7b700c4b514d9655b8810bb7478063e5c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-Bold.ttf?raw=true";
      name = "Sarabun-Bold.ttf";
      sha256 = "d38308ca27d067b9a1b79006337c1f9a66c29aa016d96a9d88d3801da7fa83b9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-BoldItalic.ttf?raw=true";
      name = "Sarabun-BoldItalic.ttf";
      sha256 = "5ef1b930f9a3afed5ec83374b5617cad3a89d91a8fc5e372dc028c2aa2950f8d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-ExtraBold.ttf?raw=true";
      name = "Sarabun-ExtraBold.ttf";
      sha256 = "1f4ba0daad63c802d825885341bd7f1f054306a669ea2b183f2b20ee65a0a043";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d82a06388d70ec34312df7e7cede76ba8bbf7b5/ofl/sarabun/Sarabun-ExtraBoldItalic.ttf?raw=true";
      name = "Sarabun-ExtraBoldItalic.ttf";
      sha256 = "4b699f0ae018a58df04bd2a2a7c37d71c29c5359cb9df48abc70210ba2564ef9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sarabun-Thin.ttf $out/share/fonts/truetype/Sarabun-Thin.ttf
     install -Dm644 Sarabun-ThinItalic.ttf $out/share/fonts/truetype/Sarabun-ThinItalic.ttf
     install -Dm644 Sarabun-ExtraLight.ttf $out/share/fonts/truetype/Sarabun-ExtraLight.ttf
     install -Dm644 Sarabun-ExtraLightItalic.ttf $out/share/fonts/truetype/Sarabun-ExtraLightItalic.ttf
     install -Dm644 Sarabun-Light.ttf $out/share/fonts/truetype/Sarabun-Light.ttf
     install -Dm644 Sarabun-LightItalic.ttf $out/share/fonts/truetype/Sarabun-LightItalic.ttf
     install -Dm644 Sarabun-Regular.ttf $out/share/fonts/truetype/Sarabun-Regular.ttf
     install -Dm644 Sarabun-Italic.ttf $out/share/fonts/truetype/Sarabun-Italic.ttf
     install -Dm644 Sarabun-Medium.ttf $out/share/fonts/truetype/Sarabun-Medium.ttf
     install -Dm644 Sarabun-MediumItalic.ttf $out/share/fonts/truetype/Sarabun-MediumItalic.ttf
     install -Dm644 Sarabun-SemiBold.ttf $out/share/fonts/truetype/Sarabun-SemiBold.ttf
     install -Dm644 Sarabun-SemiBoldItalic.ttf $out/share/fonts/truetype/Sarabun-SemiBoldItalic.ttf
     install -Dm644 Sarabun-Bold.ttf $out/share/fonts/truetype/Sarabun-Bold.ttf
     install -Dm644 Sarabun-BoldItalic.ttf $out/share/fonts/truetype/Sarabun-BoldItalic.ttf
     install -Dm644 Sarabun-ExtraBold.ttf $out/share/fonts/truetype/Sarabun-ExtraBold.ttf
     install -Dm644 Sarabun-ExtraBoldItalic.ttf $out/share/fonts/truetype/Sarabun-ExtraBoldItalic.ttf
  '';

  meta = with lib; {
    description = "Sarabun";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
