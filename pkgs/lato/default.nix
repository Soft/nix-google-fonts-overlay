{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lato-${version}";
  version = "2016-12-02-171443";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-Thin.ttf?raw=true";
      name = "Lato-Thin.ttf";
      sha256 = "663c55bfe9a38270fff44da273bf4d792eafc3e7e1201f62c3064cad80c5d5e7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-ThinItalic.ttf?raw=true";
      name = "Lato-ThinItalic.ttf";
      sha256 = "e5e86e219ce6987b175470d94d57753a387d1860b635da6327a60e8d19a33beb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-ExtraLight.ttf?raw=true";
      name = "Lato-ExtraLight.ttf";
      sha256 = "989989b481db5df0827d90c51fd08d024fe7bc4e367046e2584a0d3b0487936d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-ExtraLightItalic.ttf?raw=true";
      name = "Lato-ExtraLightItalic.ttf";
      sha256 = "fc56526250b9b64ce0908c52350b03e91b84afecb08fd2834a12e57b91abdb31";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-Light.ttf?raw=true";
      name = "Lato-Light.ttf";
      sha256 = "cf2a774503baf418d584f49967bd160e1e03f087c13b25602f28024ec7788f08";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-LightItalic.ttf?raw=true";
      name = "Lato-LightItalic.ttf";
      sha256 = "700e6722fd14a10e7646347a6b14c486d4c364a373ba61c70e0b5ccee7811635";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-Regular.ttf?raw=true";
      name = "Lato-Regular.ttf";
      sha256 = "d636e4683231f931eda222d588e944d082bfd3bdba02f928bee461c0f185b251";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-Italic.ttf?raw=true";
      name = "Lato-Italic.ttf";
      sha256 = "e399c44efe1387100531d26c7e4800c5d12251b890d6654a3098c7c679cb1786";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-Medium.ttf?raw=true";
      name = "Lato-Medium.ttf";
      sha256 = "d3ac182a6833e005745dd75679fbad081c0b12535df4e93ad8ed57817a31a338";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-MediumItalic.ttf?raw=true";
      name = "Lato-MediumItalic.ttf";
      sha256 = "ecbce6cffa42d8a67afeb27a9d6e85d515e81481d4b2cece989e833a48048405";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-SemiBold.ttf?raw=true";
      name = "Lato-SemiBold.ttf";
      sha256 = "71b8b7decbe75a881ed267be539d402bd1e9420b799658aada4e0d1bd5af803c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-SemiBoldItalic.ttf?raw=true";
      name = "Lato-SemiBoldItalic.ttf";
      sha256 = "5adeb6b334d8fb99ef053bc052b952773d544315e0e1d668a12c0ce8bd51375c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-Bold.ttf?raw=true";
      name = "Lato-Bold.ttf";
      sha256 = "8a0aace75d33794eece4b28187bfc1df0bbd2888b5d8a56e01788c8d65d16be1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-BoldItalic.ttf?raw=true";
      name = "Lato-BoldItalic.ttf";
      sha256 = "62c1b7f0d2e74b45960154c3520efc337b553db0961bfdc950d5618334596cc8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-ExtraBold.ttf?raw=true";
      name = "Lato-ExtraBold.ttf";
      sha256 = "61018de62bdaf90d4ac80b1d53c5c130756c8e9219aea3d2773fc9bd5869af97";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-ExtraBoldItalic.ttf?raw=true";
      name = "Lato-ExtraBoldItalic.ttf";
      sha256 = "a42b384b9c37913a61023e3a47c07fead26e776127bbc9e6a0c96fe413089374";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-Black.ttf?raw=true";
      name = "Lato-Black.ttf";
      sha256 = "808c62839c62dbce7de689af7603666fc7f8b81e0df537d8a5212c87580d4337";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3b885d5590e307e02542f1a724cec55d567fdaa/ofl/lato/Lato-BlackItalic.ttf?raw=true";
      name = "Lato-BlackItalic.ttf";
      sha256 = "3214f75bf96783a571bd25338c867c669e7c5e7c08a227f18a7b63766d6e6cbe";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lato-Thin.ttf $out/share/fonts/truetype/Lato-Thin.ttf
     install -Dm644 Lato-ThinItalic.ttf $out/share/fonts/truetype/Lato-ThinItalic.ttf
     install -Dm644 Lato-ExtraLight.ttf $out/share/fonts/truetype/Lato-ExtraLight.ttf
     install -Dm644 Lato-ExtraLightItalic.ttf $out/share/fonts/truetype/Lato-ExtraLightItalic.ttf
     install -Dm644 Lato-Light.ttf $out/share/fonts/truetype/Lato-Light.ttf
     install -Dm644 Lato-LightItalic.ttf $out/share/fonts/truetype/Lato-LightItalic.ttf
     install -Dm644 Lato-Regular.ttf $out/share/fonts/truetype/Lato-Regular.ttf
     install -Dm644 Lato-Italic.ttf $out/share/fonts/truetype/Lato-Italic.ttf
     install -Dm644 Lato-Medium.ttf $out/share/fonts/truetype/Lato-Medium.ttf
     install -Dm644 Lato-MediumItalic.ttf $out/share/fonts/truetype/Lato-MediumItalic.ttf
     install -Dm644 Lato-SemiBold.ttf $out/share/fonts/truetype/Lato-SemiBold.ttf
     install -Dm644 Lato-SemiBoldItalic.ttf $out/share/fonts/truetype/Lato-SemiBoldItalic.ttf
     install -Dm644 Lato-Bold.ttf $out/share/fonts/truetype/Lato-Bold.ttf
     install -Dm644 Lato-BoldItalic.ttf $out/share/fonts/truetype/Lato-BoldItalic.ttf
     install -Dm644 Lato-ExtraBold.ttf $out/share/fonts/truetype/Lato-ExtraBold.ttf
     install -Dm644 Lato-ExtraBoldItalic.ttf $out/share/fonts/truetype/Lato-ExtraBoldItalic.ttf
     install -Dm644 Lato-Black.ttf $out/share/fonts/truetype/Lato-Black.ttf
     install -Dm644 Lato-BlackItalic.ttf $out/share/fonts/truetype/Lato-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Lato";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
