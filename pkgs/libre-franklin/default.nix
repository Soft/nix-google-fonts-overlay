{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-franklin-${version}";
  version = "2017-10-15-213557";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-Thin.ttf?raw=true";
      name = "LibreFranklin-Thin.ttf";
      sha256 = "11140e94407919902f488071bb513a7194c6d558e2f2717ca83a3722e8fb625e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-ThinItalic.ttf?raw=true";
      name = "LibreFranklin-ThinItalic.ttf";
      sha256 = "e2a7479546bff167cdccbf3b9b0d265c37293b599fdd32736e9c70e520c6e9dc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-ExtraLight.ttf?raw=true";
      name = "LibreFranklin-ExtraLight.ttf";
      sha256 = "072bafddee8e171d56e2cb50ea94cb8bef3957fb0e9d5497247009c1551ffc6d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-ExtraLightItalic.ttf?raw=true";
      name = "LibreFranklin-ExtraLightItalic.ttf";
      sha256 = "caef9cce31fa14a6af2896672c8595aefcbbf5f48fa24ebac445776fe7c941b3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-Light.ttf?raw=true";
      name = "LibreFranklin-Light.ttf";
      sha256 = "6942643565ab95ff9ec7643043892419fc67faa284c009b562fa21ec12868df6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-LightItalic.ttf?raw=true";
      name = "LibreFranklin-LightItalic.ttf";
      sha256 = "2845d3c3d5d19e8ffd926304f3b7060532c0d54a117bd62071e97c4024c059df";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-Regular.ttf?raw=true";
      name = "LibreFranklin-Regular.ttf";
      sha256 = "1192091dde4666a1c57ded2e2f85e98b09d187cb361b35d976402cb4c7f4e6a1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-Italic.ttf?raw=true";
      name = "LibreFranklin-Italic.ttf";
      sha256 = "f7ce99ed4561e7a2a6e0ad295cc2f02f30c90b7fc22c187111e867aefc39ff97";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-Medium.ttf?raw=true";
      name = "LibreFranklin-Medium.ttf";
      sha256 = "c04298239b5768b007ca0079b0db8b931d4c5d08b7aa644ea061ae057489ec08";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-MediumItalic.ttf?raw=true";
      name = "LibreFranklin-MediumItalic.ttf";
      sha256 = "a82ce9500139cc3be51da92a2b467bdf1d2db7bf5b0c0b0b5184bdae5ff05407";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-SemiBold.ttf?raw=true";
      name = "LibreFranklin-SemiBold.ttf";
      sha256 = "278c0b25b643823566167212fe9d4e72e1c44943f967df82fc84c001b85f4e1a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-SemiBoldItalic.ttf?raw=true";
      name = "LibreFranklin-SemiBoldItalic.ttf";
      sha256 = "eb14c73c296078840b95490e03337bdb208711cf376e67300f6d323a9b8ea7f4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-Bold.ttf?raw=true";
      name = "LibreFranklin-Bold.ttf";
      sha256 = "9da22ab31acff7a18425491d4822bfb228146d6b3cbed6c33449380904979ee3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-BoldItalic.ttf?raw=true";
      name = "LibreFranklin-BoldItalic.ttf";
      sha256 = "2b99f4abddc5b6d291966444ef78971b7287a7066dfcfba3b59cffb44d6294a2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-ExtraBold.ttf?raw=true";
      name = "LibreFranklin-ExtraBold.ttf";
      sha256 = "b97d6df985b901e75d3462e41f081e44a1c80392139db59260786da54c6353e4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-ExtraBoldItalic.ttf?raw=true";
      name = "LibreFranklin-ExtraBoldItalic.ttf";
      sha256 = "923a58e23407758baec0be60184b088642d7a5da8a56a6fddb8d4e9333a6330b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-Black.ttf?raw=true";
      name = "LibreFranklin-Black.ttf";
      sha256 = "cb8ed9f082c83239b6a7163a011583b9c628b525a13d8164a8b9351d5d7f0438";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/librefranklin/LibreFranklin-BlackItalic.ttf?raw=true";
      name = "LibreFranklin-BlackItalic.ttf";
      sha256 = "86f44e32053c2580964bd8ef0be03ef106a510c95f45c76677737ce8f5962669";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreFranklin-Thin.ttf $out/share/fonts/truetype/LibreFranklin-Thin.ttf
     install -Dm644 LibreFranklin-ThinItalic.ttf $out/share/fonts/truetype/LibreFranklin-ThinItalic.ttf
     install -Dm644 LibreFranklin-ExtraLight.ttf $out/share/fonts/truetype/LibreFranklin-ExtraLight.ttf
     install -Dm644 LibreFranklin-ExtraLightItalic.ttf $out/share/fonts/truetype/LibreFranklin-ExtraLightItalic.ttf
     install -Dm644 LibreFranklin-Light.ttf $out/share/fonts/truetype/LibreFranklin-Light.ttf
     install -Dm644 LibreFranklin-LightItalic.ttf $out/share/fonts/truetype/LibreFranklin-LightItalic.ttf
     install -Dm644 LibreFranklin-Regular.ttf $out/share/fonts/truetype/LibreFranklin-Regular.ttf
     install -Dm644 LibreFranklin-Italic.ttf $out/share/fonts/truetype/LibreFranklin-Italic.ttf
     install -Dm644 LibreFranklin-Medium.ttf $out/share/fonts/truetype/LibreFranklin-Medium.ttf
     install -Dm644 LibreFranklin-MediumItalic.ttf $out/share/fonts/truetype/LibreFranklin-MediumItalic.ttf
     install -Dm644 LibreFranklin-SemiBold.ttf $out/share/fonts/truetype/LibreFranklin-SemiBold.ttf
     install -Dm644 LibreFranklin-SemiBoldItalic.ttf $out/share/fonts/truetype/LibreFranklin-SemiBoldItalic.ttf
     install -Dm644 LibreFranklin-Bold.ttf $out/share/fonts/truetype/LibreFranklin-Bold.ttf
     install -Dm644 LibreFranklin-BoldItalic.ttf $out/share/fonts/truetype/LibreFranklin-BoldItalic.ttf
     install -Dm644 LibreFranklin-ExtraBold.ttf $out/share/fonts/truetype/LibreFranklin-ExtraBold.ttf
     install -Dm644 LibreFranklin-ExtraBoldItalic.ttf $out/share/fonts/truetype/LibreFranklin-ExtraBoldItalic.ttf
     install -Dm644 LibreFranklin-Black.ttf $out/share/fonts/truetype/LibreFranklin-Black.ttf
     install -Dm644 LibreFranklin-BlackItalic.ttf $out/share/fonts/truetype/LibreFranklin-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Libre Franklin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
