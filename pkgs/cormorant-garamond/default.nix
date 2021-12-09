{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cormorant-garamond-${version}";
  version = "2017-02-07-173853";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6caad1789da833809c4cc42908986f8c71199055/ofl/cormorantgaramond/CormorantGaramond-Light.ttf?raw=true";
      name = "CormorantGaramond-Light.ttf";
      sha256 = "9978e5fdcf43e56c9472a28ce4868bd0fc925dedc4817bf8a69827b206216a4d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6caad1789da833809c4cc42908986f8c71199055/ofl/cormorantgaramond/CormorantGaramond-LightItalic.ttf?raw=true";
      name = "CormorantGaramond-LightItalic.ttf";
      sha256 = "3e4c90b715a53a4f1419da22e0f91d024e63ae1efcbd00b3fc6e9c2f2a5b5f0a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6caad1789da833809c4cc42908986f8c71199055/ofl/cormorantgaramond/CormorantGaramond-Regular.ttf?raw=true";
      name = "CormorantGaramond-Regular.ttf";
      sha256 = "7c1aace7373d5603eb520713a8d69e71e7ed75ca95965cb3872f6a74c399eff9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6caad1789da833809c4cc42908986f8c71199055/ofl/cormorantgaramond/CormorantGaramond-Italic.ttf?raw=true";
      name = "CormorantGaramond-Italic.ttf";
      sha256 = "6458bdd71b7ffaa7e2bf44a3ff66d2bb49de4841958d853cfcb779c7b1ddc890";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6caad1789da833809c4cc42908986f8c71199055/ofl/cormorantgaramond/CormorantGaramond-Medium.ttf?raw=true";
      name = "CormorantGaramond-Medium.ttf";
      sha256 = "5c7cd8553eb6ff6d08fc4408bb63744dfc9f70d64dacd6ec194e3048532323e1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6caad1789da833809c4cc42908986f8c71199055/ofl/cormorantgaramond/CormorantGaramond-MediumItalic.ttf?raw=true";
      name = "CormorantGaramond-MediumItalic.ttf";
      sha256 = "7d3d1165050f20b767284587eb5e303b194c795d6fa590492c9650cc3e8bf0b3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6caad1789da833809c4cc42908986f8c71199055/ofl/cormorantgaramond/CormorantGaramond-SemiBold.ttf?raw=true";
      name = "CormorantGaramond-SemiBold.ttf";
      sha256 = "4fcd2d97820dac2be5f9c24d7fbd264a08f89b16a0d12fcc80541b3fbd44ee92";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6caad1789da833809c4cc42908986f8c71199055/ofl/cormorantgaramond/CormorantGaramond-SemiBoldItalic.ttf?raw=true";
      name = "CormorantGaramond-SemiBoldItalic.ttf";
      sha256 = "15a0b18268068ed47d2c920671c1cca6637226af132797f3e52716162fe14b6a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6caad1789da833809c4cc42908986f8c71199055/ofl/cormorantgaramond/CormorantGaramond-Bold.ttf?raw=true";
      name = "CormorantGaramond-Bold.ttf";
      sha256 = "e77391f7054f9e0611730cb83612a13541bae9377fa9a6cfeaf27a54e45714d3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6caad1789da833809c4cc42908986f8c71199055/ofl/cormorantgaramond/CormorantGaramond-BoldItalic.ttf?raw=true";
      name = "CormorantGaramond-BoldItalic.ttf";
      sha256 = "00d0ecdcf488cc2318e0ebdc66cedb97fe5ea9746b22c0a7617d5e24d63d990b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CormorantGaramond-Light.ttf $out/share/fonts/truetype/CormorantGaramond-Light.ttf
     install -Dm644 CormorantGaramond-LightItalic.ttf $out/share/fonts/truetype/CormorantGaramond-LightItalic.ttf
     install -Dm644 CormorantGaramond-Regular.ttf $out/share/fonts/truetype/CormorantGaramond-Regular.ttf
     install -Dm644 CormorantGaramond-Italic.ttf $out/share/fonts/truetype/CormorantGaramond-Italic.ttf
     install -Dm644 CormorantGaramond-Medium.ttf $out/share/fonts/truetype/CormorantGaramond-Medium.ttf
     install -Dm644 CormorantGaramond-MediumItalic.ttf $out/share/fonts/truetype/CormorantGaramond-MediumItalic.ttf
     install -Dm644 CormorantGaramond-SemiBold.ttf $out/share/fonts/truetype/CormorantGaramond-SemiBold.ttf
     install -Dm644 CormorantGaramond-SemiBoldItalic.ttf $out/share/fonts/truetype/CormorantGaramond-SemiBoldItalic.ttf
     install -Dm644 CormorantGaramond-Bold.ttf $out/share/fonts/truetype/CormorantGaramond-Bold.ttf
     install -Dm644 CormorantGaramond-BoldItalic.ttf $out/share/fonts/truetype/CormorantGaramond-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Cormorant Garamond";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
