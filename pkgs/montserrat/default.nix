{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montserrat-${version}";
  version = "2017-11-03-205118";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-Thin.ttf?raw=true";
      name = "Montserrat-Thin.ttf";
      sha256 = "5583fb2839a295334e3164d5fcd560013101631696e23d228fdffdd282ffd44f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-ThinItalic.ttf?raw=true";
      name = "Montserrat-ThinItalic.ttf";
      sha256 = "ee11b78b84090bfd14e3a9e5c23a13b646773fea299fb28fcff926fa2db1ac80";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-ExtraLight.ttf?raw=true";
      name = "Montserrat-ExtraLight.ttf";
      sha256 = "6a15672ddcc6b5bc51515daee2010dba7f1d21add02bdc4c7f89b480fc7e5a99";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-ExtraLightItalic.ttf?raw=true";
      name = "Montserrat-ExtraLightItalic.ttf";
      sha256 = "defabfd139d3fb07704eca1ace2b961fb2260394d2f792e0fb7a7a7232da7799";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-Light.ttf?raw=true";
      name = "Montserrat-Light.ttf";
      sha256 = "9b87925d061b1affb66417717731ad781f7d7678fb089b49f14bd922c2338559";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-LightItalic.ttf?raw=true";
      name = "Montserrat-LightItalic.ttf";
      sha256 = "a634ac89c843302afa15a4c4e7353f7a5bff3e72fa0e0b2d9d0f144ad3b2c674";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-Regular.ttf?raw=true";
      name = "Montserrat-Regular.ttf";
      sha256 = "81ebc3916b524007b756d91d9df13c7673ec401161f2cad161662d08dcf1cc72";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-Italic.ttf?raw=true";
      name = "Montserrat-Italic.ttf";
      sha256 = "4854167729baeda55f3169812cb10cfadad93614218c2cbe1274fb6123b3a916";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-Medium.ttf?raw=true";
      name = "Montserrat-Medium.ttf";
      sha256 = "92b3d3c6e135eb1dc95f88e6ca75bd6113d9eb3261a95ca39f733e3897e53675";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-MediumItalic.ttf?raw=true";
      name = "Montserrat-MediumItalic.ttf";
      sha256 = "08edb1a99610549dce56ed6ca137c6c6f5f8a53751efb52a504aac95ed056480";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-SemiBold.ttf?raw=true";
      name = "Montserrat-SemiBold.ttf";
      sha256 = "bab583d38d105dac9141b287fb2b7763b6d8b0bae97e745faaccedb40a579c29";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-SemiBoldItalic.ttf?raw=true";
      name = "Montserrat-SemiBoldItalic.ttf";
      sha256 = "13db98b04dc90a529d0387ef5db4e5e5511746f460a3d820e75f6ceee0082652";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-Bold.ttf?raw=true";
      name = "Montserrat-Bold.ttf";
      sha256 = "c4c8cb572a5a2c43d78b3701f4b2349684e6ca4d1557e469af6065b1e099c26c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-BoldItalic.ttf?raw=true";
      name = "Montserrat-BoldItalic.ttf";
      sha256 = "91371db417bc137a0edb00a9b441c0d4913bbf3320dd038dea124eaf8a565c23";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-ExtraBold.ttf?raw=true";
      name = "Montserrat-ExtraBold.ttf";
      sha256 = "257af9a05de6371e1f7b345d02a93af5c2e0ab9b9224418a45189b8cc86049cd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-ExtraBoldItalic.ttf?raw=true";
      name = "Montserrat-ExtraBoldItalic.ttf";
      sha256 = "0fc80e1fe468b4edce5831f35315c7e8372a0af549a17d8138b66a17f9f9d00e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-Black.ttf?raw=true";
      name = "Montserrat-Black.ttf";
      sha256 = "da0b09317f1ceffb9767876579b15dc4dc9f75784e678404aa80632b6771207d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9548902f8a5a0b4a0bb7427d93347a9ba9fd0f2e/ofl/montserrat/Montserrat-BlackItalic.ttf?raw=true";
      name = "Montserrat-BlackItalic.ttf";
      sha256 = "87279bedd810d29f8b83e36e486258c4ba683dbe445241c7962eff05223db58c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Montserrat-Thin.ttf $out/share/fonts/truetype/Montserrat-Thin.ttf
     install -Dm644 Montserrat-ThinItalic.ttf $out/share/fonts/truetype/Montserrat-ThinItalic.ttf
     install -Dm644 Montserrat-ExtraLight.ttf $out/share/fonts/truetype/Montserrat-ExtraLight.ttf
     install -Dm644 Montserrat-ExtraLightItalic.ttf $out/share/fonts/truetype/Montserrat-ExtraLightItalic.ttf
     install -Dm644 Montserrat-Light.ttf $out/share/fonts/truetype/Montserrat-Light.ttf
     install -Dm644 Montserrat-LightItalic.ttf $out/share/fonts/truetype/Montserrat-LightItalic.ttf
     install -Dm644 Montserrat-Regular.ttf $out/share/fonts/truetype/Montserrat-Regular.ttf
     install -Dm644 Montserrat-Italic.ttf $out/share/fonts/truetype/Montserrat-Italic.ttf
     install -Dm644 Montserrat-Medium.ttf $out/share/fonts/truetype/Montserrat-Medium.ttf
     install -Dm644 Montserrat-MediumItalic.ttf $out/share/fonts/truetype/Montserrat-MediumItalic.ttf
     install -Dm644 Montserrat-SemiBold.ttf $out/share/fonts/truetype/Montserrat-SemiBold.ttf
     install -Dm644 Montserrat-SemiBoldItalic.ttf $out/share/fonts/truetype/Montserrat-SemiBoldItalic.ttf
     install -Dm644 Montserrat-Bold.ttf $out/share/fonts/truetype/Montserrat-Bold.ttf
     install -Dm644 Montserrat-BoldItalic.ttf $out/share/fonts/truetype/Montserrat-BoldItalic.ttf
     install -Dm644 Montserrat-ExtraBold.ttf $out/share/fonts/truetype/Montserrat-ExtraBold.ttf
     install -Dm644 Montserrat-ExtraBoldItalic.ttf $out/share/fonts/truetype/Montserrat-ExtraBoldItalic.ttf
     install -Dm644 Montserrat-Black.ttf $out/share/fonts/truetype/Montserrat-Black.ttf
     install -Dm644 Montserrat-BlackItalic.ttf $out/share/fonts/truetype/Montserrat-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Montserrat";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
