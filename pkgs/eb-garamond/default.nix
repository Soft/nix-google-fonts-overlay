{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "eb-garamond-${version}";
  version = "2017-10-31-191802";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62e0ebd5d20c6698fe2712f72b411ea30730c6ff/ofl/ebgaramond/EBGaramond-Regular.ttf?raw=true";
      name = "EBGaramond-Regular.ttf";
      sha256 = "b7ea01de395bc600d5490105b11ed25f4c885d25f69c6302a22a44d4b3b53542";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62e0ebd5d20c6698fe2712f72b411ea30730c6ff/ofl/ebgaramond/EBGaramond-Italic.ttf?raw=true";
      name = "EBGaramond-Italic.ttf";
      sha256 = "1712f5c2115883a76450335bb4122c06a0fce3dc05c7affb78fb77de8d4322de";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62e0ebd5d20c6698fe2712f72b411ea30730c6ff/ofl/ebgaramond/EBGaramond-Medium.ttf?raw=true";
      name = "EBGaramond-Medium.ttf";
      sha256 = "9c465f144798eb42245e914fc1fd8ee0056474db03d64f147ffbf5e6d08ef1a4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62e0ebd5d20c6698fe2712f72b411ea30730c6ff/ofl/ebgaramond/EBGaramond-MediumItalic.ttf?raw=true";
      name = "EBGaramond-MediumItalic.ttf";
      sha256 = "3957b21a09f2bf29932467c6d7835427f9964c304f16f46f9280ce0c9809bd01";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62e0ebd5d20c6698fe2712f72b411ea30730c6ff/ofl/ebgaramond/EBGaramond-SemiBold.ttf?raw=true";
      name = "EBGaramond-SemiBold.ttf";
      sha256 = "12d930f3240bf388920865289166bd5de641e0880468575cd8386e161ca1f4ff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62e0ebd5d20c6698fe2712f72b411ea30730c6ff/ofl/ebgaramond/EBGaramond-SemiBoldItalic.ttf?raw=true";
      name = "EBGaramond-SemiBoldItalic.ttf";
      sha256 = "0d9cd9dd9a945abe189e3b34e8c8da3430ba21ac8532f88cf8b82b1abea56006";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62e0ebd5d20c6698fe2712f72b411ea30730c6ff/ofl/ebgaramond/EBGaramond-Bold.ttf?raw=true";
      name = "EBGaramond-Bold.ttf";
      sha256 = "d3c03678a47809d90649e48ef0c37f2d65c6f000360aa21f4172dba3cb7736a2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62e0ebd5d20c6698fe2712f72b411ea30730c6ff/ofl/ebgaramond/EBGaramond-BoldItalic.ttf?raw=true";
      name = "EBGaramond-BoldItalic.ttf";
      sha256 = "6fad92145604e8808d8b2677472908caeab73e37b1188fcc69af20d153188fe1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62e0ebd5d20c6698fe2712f72b411ea30730c6ff/ofl/ebgaramond/EBGaramond-ExtraBold.ttf?raw=true";
      name = "EBGaramond-ExtraBold.ttf";
      sha256 = "80275782272b75a3fa6b6ed93d29f15bb457d0c321e928564a38e2b38c07375a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62e0ebd5d20c6698fe2712f72b411ea30730c6ff/ofl/ebgaramond/EBGaramond-ExtraBoldItalic.ttf?raw=true";
      name = "EBGaramond-ExtraBoldItalic.ttf";
      sha256 = "04db74870ae2b69df0d2c28c50387faf50d09df624aeed0642fdb96d9f757210";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EBGaramond-Regular.ttf $out/share/fonts/truetype/EBGaramond-Regular.ttf
     install -Dm644 EBGaramond-Italic.ttf $out/share/fonts/truetype/EBGaramond-Italic.ttf
     install -Dm644 EBGaramond-Medium.ttf $out/share/fonts/truetype/EBGaramond-Medium.ttf
     install -Dm644 EBGaramond-MediumItalic.ttf $out/share/fonts/truetype/EBGaramond-MediumItalic.ttf
     install -Dm644 EBGaramond-SemiBold.ttf $out/share/fonts/truetype/EBGaramond-SemiBold.ttf
     install -Dm644 EBGaramond-SemiBoldItalic.ttf $out/share/fonts/truetype/EBGaramond-SemiBoldItalic.ttf
     install -Dm644 EBGaramond-Bold.ttf $out/share/fonts/truetype/EBGaramond-Bold.ttf
     install -Dm644 EBGaramond-BoldItalic.ttf $out/share/fonts/truetype/EBGaramond-BoldItalic.ttf
     install -Dm644 EBGaramond-ExtraBold.ttf $out/share/fonts/truetype/EBGaramond-ExtraBold.ttf
     install -Dm644 EBGaramond-ExtraBoldItalic.ttf $out/share/fonts/truetype/EBGaramond-ExtraBoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "EB Garamond";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
