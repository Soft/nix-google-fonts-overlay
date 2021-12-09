{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alegreya-sans-${version}";
  version = "2017-11-09-170915";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/414832ad3de91ca90fbea0d6cbf4aafa2ecc7804/ofl/alegreyasans/AlegreyaSans-Thin.ttf?raw=true";
      name = "AlegreyaSans-Thin.ttf";
      sha256 = "10a9d38eac06bf5d46930529b254a1bcf235c2ced7ca8fa48437fb7ddf45b674";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/414832ad3de91ca90fbea0d6cbf4aafa2ecc7804/ofl/alegreyasans/AlegreyaSans-ThinItalic.ttf?raw=true";
      name = "AlegreyaSans-ThinItalic.ttf";
      sha256 = "becc50470e3c6b29842da369485cf47523269bb2458820dc8ce7817fa4754041";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/414832ad3de91ca90fbea0d6cbf4aafa2ecc7804/ofl/alegreyasans/AlegreyaSans-Light.ttf?raw=true";
      name = "AlegreyaSans-Light.ttf";
      sha256 = "4c60a844c618502e95117426127746378bf5ac3776e04b7ab65ed3d5dc3ae081";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/414832ad3de91ca90fbea0d6cbf4aafa2ecc7804/ofl/alegreyasans/AlegreyaSans-LightItalic.ttf?raw=true";
      name = "AlegreyaSans-LightItalic.ttf";
      sha256 = "4b52d6e2d85f4e6310bc50d45a6acea83077ec8cd87f63b74e853314bcaab128";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/414832ad3de91ca90fbea0d6cbf4aafa2ecc7804/ofl/alegreyasans/AlegreyaSans-Regular.ttf?raw=true";
      name = "AlegreyaSans-Regular.ttf";
      sha256 = "8fab634196007afca839f1e5a6fb300976daff55d8528b590ef032f01b14ea10";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/414832ad3de91ca90fbea0d6cbf4aafa2ecc7804/ofl/alegreyasans/AlegreyaSans-Italic.ttf?raw=true";
      name = "AlegreyaSans-Italic.ttf";
      sha256 = "f49f6f2bdd84df850b25b0f8185d8a051e1d1eb2dd08e2f91b8c7b86d9a9e1a6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/414832ad3de91ca90fbea0d6cbf4aafa2ecc7804/ofl/alegreyasans/AlegreyaSans-Medium.ttf?raw=true";
      name = "AlegreyaSans-Medium.ttf";
      sha256 = "4b89fe7804fd1485ec2757795a53ffdb66e1206dd56f844c2d72b3c944815b43";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/414832ad3de91ca90fbea0d6cbf4aafa2ecc7804/ofl/alegreyasans/AlegreyaSans-MediumItalic.ttf?raw=true";
      name = "AlegreyaSans-MediumItalic.ttf";
      sha256 = "0c79da462ae637d7f95f428c935cac7a9c22cb99655c5cd37b87080861dd73ec";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/414832ad3de91ca90fbea0d6cbf4aafa2ecc7804/ofl/alegreyasans/AlegreyaSans-Bold.ttf?raw=true";
      name = "AlegreyaSans-Bold.ttf";
      sha256 = "a3055a1893759bdbd7504bb22abc583769e7974c49353176eac0b03792c9fb8e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/414832ad3de91ca90fbea0d6cbf4aafa2ecc7804/ofl/alegreyasans/AlegreyaSans-BoldItalic.ttf?raw=true";
      name = "AlegreyaSans-BoldItalic.ttf";
      sha256 = "6a5550f0e4c3021e7e2e83ac4814e8c649a0fe20385489ce7609f00802097b4d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/414832ad3de91ca90fbea0d6cbf4aafa2ecc7804/ofl/alegreyasans/AlegreyaSans-ExtraBold.ttf?raw=true";
      name = "AlegreyaSans-ExtraBold.ttf";
      sha256 = "3861f08a77d5c1b3b311055913443b07337a4b7abaff21a8cdb51fc0ae980b9e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/414832ad3de91ca90fbea0d6cbf4aafa2ecc7804/ofl/alegreyasans/AlegreyaSans-ExtraBoldItalic.ttf?raw=true";
      name = "AlegreyaSans-ExtraBoldItalic.ttf";
      sha256 = "3ed9e028241a8c111982006fa5e9c2ccb1f7d4683789d219cb30e8010746c37e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/414832ad3de91ca90fbea0d6cbf4aafa2ecc7804/ofl/alegreyasans/AlegreyaSans-Black.ttf?raw=true";
      name = "AlegreyaSans-Black.ttf";
      sha256 = "95f06dd3f6e4529f176b371e89be1d5894c3ed0606c31b1d76b092a1308c1fc0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/414832ad3de91ca90fbea0d6cbf4aafa2ecc7804/ofl/alegreyasans/AlegreyaSans-BlackItalic.ttf?raw=true";
      name = "AlegreyaSans-BlackItalic.ttf";
      sha256 = "b95a8679d329ec79b5eec84e0de00f3d88ff79c4a1deaebdad77cf4ccb851282";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlegreyaSans-Thin.ttf $out/share/fonts/truetype/AlegreyaSans-Thin.ttf
     install -Dm644 AlegreyaSans-ThinItalic.ttf $out/share/fonts/truetype/AlegreyaSans-ThinItalic.ttf
     install -Dm644 AlegreyaSans-Light.ttf $out/share/fonts/truetype/AlegreyaSans-Light.ttf
     install -Dm644 AlegreyaSans-LightItalic.ttf $out/share/fonts/truetype/AlegreyaSans-LightItalic.ttf
     install -Dm644 AlegreyaSans-Regular.ttf $out/share/fonts/truetype/AlegreyaSans-Regular.ttf
     install -Dm644 AlegreyaSans-Italic.ttf $out/share/fonts/truetype/AlegreyaSans-Italic.ttf
     install -Dm644 AlegreyaSans-Medium.ttf $out/share/fonts/truetype/AlegreyaSans-Medium.ttf
     install -Dm644 AlegreyaSans-MediumItalic.ttf $out/share/fonts/truetype/AlegreyaSans-MediumItalic.ttf
     install -Dm644 AlegreyaSans-Bold.ttf $out/share/fonts/truetype/AlegreyaSans-Bold.ttf
     install -Dm644 AlegreyaSans-BoldItalic.ttf $out/share/fonts/truetype/AlegreyaSans-BoldItalic.ttf
     install -Dm644 AlegreyaSans-ExtraBold.ttf $out/share/fonts/truetype/AlegreyaSans-ExtraBold.ttf
     install -Dm644 AlegreyaSans-ExtraBoldItalic.ttf $out/share/fonts/truetype/AlegreyaSans-ExtraBoldItalic.ttf
     install -Dm644 AlegreyaSans-Black.ttf $out/share/fonts/truetype/AlegreyaSans-Black.ttf
     install -Dm644 AlegreyaSans-BlackItalic.ttf $out/share/fonts/truetype/AlegreyaSans-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Alegreya Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
