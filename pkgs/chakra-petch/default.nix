{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chakra-petch-${version}";
  version = "2018-09-07-134803";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c011968d86a629939a4fd8b62a3b18549db0d855/ofl/chakrapetch/ChakraPetch-Light.ttf?raw=true";
      name = "ChakraPetch-Light.ttf";
      sha256 = "13a106a367b903fb509ed11e7c921589a0d42c22540510d3ca8f6c7343bef76b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c011968d86a629939a4fd8b62a3b18549db0d855/ofl/chakrapetch/ChakraPetch-LightItalic.ttf?raw=true";
      name = "ChakraPetch-LightItalic.ttf";
      sha256 = "67e426488e221d5d9e5a3b62a34b45f1f534dabd1078bdc77fcdfe43630cbee0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c011968d86a629939a4fd8b62a3b18549db0d855/ofl/chakrapetch/ChakraPetch-Regular.ttf?raw=true";
      name = "ChakraPetch-Regular.ttf";
      sha256 = "98fcd638baa5c81ff0316b7538ce330ee3b23b1302726de3526d5933a8ecf986";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c011968d86a629939a4fd8b62a3b18549db0d855/ofl/chakrapetch/ChakraPetch-Italic.ttf?raw=true";
      name = "ChakraPetch-Italic.ttf";
      sha256 = "3aeea48f0ffab0d6ad8d3cd0cb9c0ceb98ecbcf363521ce56fceea51ecbb1d1f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c011968d86a629939a4fd8b62a3b18549db0d855/ofl/chakrapetch/ChakraPetch-Medium.ttf?raw=true";
      name = "ChakraPetch-Medium.ttf";
      sha256 = "d480f4f97405fac3600652e2e14fd0b14339031c0af4da11582994878f04d919";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c011968d86a629939a4fd8b62a3b18549db0d855/ofl/chakrapetch/ChakraPetch-MediumItalic.ttf?raw=true";
      name = "ChakraPetch-MediumItalic.ttf";
      sha256 = "3a9185b6735897aeb38fdd132aae761a9092001c7615ac9e2238131bf9b099ed";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c011968d86a629939a4fd8b62a3b18549db0d855/ofl/chakrapetch/ChakraPetch-SemiBold.ttf?raw=true";
      name = "ChakraPetch-SemiBold.ttf";
      sha256 = "45264de3204ddbd5fb3e14a2402acd5c630d16650ae5fc221d2c52da46a6734b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c011968d86a629939a4fd8b62a3b18549db0d855/ofl/chakrapetch/ChakraPetch-SemiBoldItalic.ttf?raw=true";
      name = "ChakraPetch-SemiBoldItalic.ttf";
      sha256 = "4e11c1bec71511bbea8a3bc3f4cebff479bb9681961d691a36f99e5234d8fe89";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c011968d86a629939a4fd8b62a3b18549db0d855/ofl/chakrapetch/ChakraPetch-Bold.ttf?raw=true";
      name = "ChakraPetch-Bold.ttf";
      sha256 = "65fbf76d95651697275e19db4d717c0e95a789ddd3476478b05292104db278a0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c011968d86a629939a4fd8b62a3b18549db0d855/ofl/chakrapetch/ChakraPetch-BoldItalic.ttf?raw=true";
      name = "ChakraPetch-BoldItalic.ttf";
      sha256 = "bf012ce1894ffcf7d32d3e6548b90df7c40f30161b5cc295eb54ff61c21fab19";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ChakraPetch-Light.ttf $out/share/fonts/truetype/ChakraPetch-Light.ttf
     install -Dm644 ChakraPetch-LightItalic.ttf $out/share/fonts/truetype/ChakraPetch-LightItalic.ttf
     install -Dm644 ChakraPetch-Regular.ttf $out/share/fonts/truetype/ChakraPetch-Regular.ttf
     install -Dm644 ChakraPetch-Italic.ttf $out/share/fonts/truetype/ChakraPetch-Italic.ttf
     install -Dm644 ChakraPetch-Medium.ttf $out/share/fonts/truetype/ChakraPetch-Medium.ttf
     install -Dm644 ChakraPetch-MediumItalic.ttf $out/share/fonts/truetype/ChakraPetch-MediumItalic.ttf
     install -Dm644 ChakraPetch-SemiBold.ttf $out/share/fonts/truetype/ChakraPetch-SemiBold.ttf
     install -Dm644 ChakraPetch-SemiBoldItalic.ttf $out/share/fonts/truetype/ChakraPetch-SemiBoldItalic.ttf
     install -Dm644 ChakraPetch-Bold.ttf $out/share/fonts/truetype/ChakraPetch-Bold.ttf
     install -Dm644 ChakraPetch-BoldItalic.ttf $out/share/fonts/truetype/ChakraPetch-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Chakra Petch";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
