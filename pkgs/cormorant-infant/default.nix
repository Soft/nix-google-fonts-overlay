{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cormorant-infant-${version}";
  version = "2017-02-07-173904";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b6e8dd55de9b8f736f6a5ced7aa0fbd38650c110/ofl/cormorantinfant/CormorantInfant-Light.ttf?raw=true";
      name = "CormorantInfant-Light.ttf";
      sha256 = "8d715b24236fcf0a4216c4511546d759e404169c0c173ca1b393af15665b1f84";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b6e8dd55de9b8f736f6a5ced7aa0fbd38650c110/ofl/cormorantinfant/CormorantInfant-LightItalic.ttf?raw=true";
      name = "CormorantInfant-LightItalic.ttf";
      sha256 = "ba4e1958f4e305f30bc021248953e218aa14095eed31dadbd28b5a29f09d8207";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b6e8dd55de9b8f736f6a5ced7aa0fbd38650c110/ofl/cormorantinfant/CormorantInfant-Regular.ttf?raw=true";
      name = "CormorantInfant-Regular.ttf";
      sha256 = "faa0e58b93f2ad3962c4ede13df15588d180bd89ff9431d1117411ea8af4bc24";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b6e8dd55de9b8f736f6a5ced7aa0fbd38650c110/ofl/cormorantinfant/CormorantInfant-Italic.ttf?raw=true";
      name = "CormorantInfant-Italic.ttf";
      sha256 = "907c4f1b502661de98ccbe9bcea5332535fc8335b374844f89af17e8b263ad4d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b6e8dd55de9b8f736f6a5ced7aa0fbd38650c110/ofl/cormorantinfant/CormorantInfant-Medium.ttf?raw=true";
      name = "CormorantInfant-Medium.ttf";
      sha256 = "7ee75648c9690afcdb8941e748e7bb354932effa3d1d7ae66e69f6a4e9553a18";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b6e8dd55de9b8f736f6a5ced7aa0fbd38650c110/ofl/cormorantinfant/CormorantInfant-MediumItalic.ttf?raw=true";
      name = "CormorantInfant-MediumItalic.ttf";
      sha256 = "9b7f673261bee61ac0e38e7ba72cba1e1f161d56fa92d5fd5e27009dcca75478";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b6e8dd55de9b8f736f6a5ced7aa0fbd38650c110/ofl/cormorantinfant/CormorantInfant-SemiBold.ttf?raw=true";
      name = "CormorantInfant-SemiBold.ttf";
      sha256 = "1940b28f423afbbc1d43dc91a7d47243b30409adea8cf32fb6198817a85d4d35";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b6e8dd55de9b8f736f6a5ced7aa0fbd38650c110/ofl/cormorantinfant/CormorantInfant-SemiBoldItalic.ttf?raw=true";
      name = "CormorantInfant-SemiBoldItalic.ttf";
      sha256 = "480b04a841e7a2ea26ba5dcce9121bfe5863f3e06f409743149358183bdb6618";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b6e8dd55de9b8f736f6a5ced7aa0fbd38650c110/ofl/cormorantinfant/CormorantInfant-Bold.ttf?raw=true";
      name = "CormorantInfant-Bold.ttf";
      sha256 = "e01dd1685903c6ffe93d708c1bdde1c64df9be900731f7083f8dc1c9c9aede3d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b6e8dd55de9b8f736f6a5ced7aa0fbd38650c110/ofl/cormorantinfant/CormorantInfant-BoldItalic.ttf?raw=true";
      name = "CormorantInfant-BoldItalic.ttf";
      sha256 = "8aaa5ab1ff81b12f2d15a1d561f5e60440148feac237ecc38cee0a7d50699b21";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CormorantInfant-Light.ttf $out/share/fonts/truetype/CormorantInfant-Light.ttf
     install -Dm644 CormorantInfant-LightItalic.ttf $out/share/fonts/truetype/CormorantInfant-LightItalic.ttf
     install -Dm644 CormorantInfant-Regular.ttf $out/share/fonts/truetype/CormorantInfant-Regular.ttf
     install -Dm644 CormorantInfant-Italic.ttf $out/share/fonts/truetype/CormorantInfant-Italic.ttf
     install -Dm644 CormorantInfant-Medium.ttf $out/share/fonts/truetype/CormorantInfant-Medium.ttf
     install -Dm644 CormorantInfant-MediumItalic.ttf $out/share/fonts/truetype/CormorantInfant-MediumItalic.ttf
     install -Dm644 CormorantInfant-SemiBold.ttf $out/share/fonts/truetype/CormorantInfant-SemiBold.ttf
     install -Dm644 CormorantInfant-SemiBoldItalic.ttf $out/share/fonts/truetype/CormorantInfant-SemiBoldItalic.ttf
     install -Dm644 CormorantInfant-Bold.ttf $out/share/fonts/truetype/CormorantInfant-Bold.ttf
     install -Dm644 CormorantInfant-BoldItalic.ttf $out/share/fonts/truetype/CormorantInfant-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Cormorant Infant";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
