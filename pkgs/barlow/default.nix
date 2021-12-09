{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "barlow-${version}";
  version = "2018-12-05-153357";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-Thin.ttf?raw=true";
      name = "Barlow-Thin.ttf";
      sha256 = "103671e5a8daf1c02ac2cb35c61fa30088e055e5ff718d51b4fb20012581d252";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-ThinItalic.ttf?raw=true";
      name = "Barlow-ThinItalic.ttf";
      sha256 = "4e948103b1bf05649baaea64747e410dc21671ad56eafd5dd3e6f2062b5ff35d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-ExtraLight.ttf?raw=true";
      name = "Barlow-ExtraLight.ttf";
      sha256 = "bd47db14c6305ebb647a3f0c6afc0370ffd4e3368f12405c8cd141683a4c2b05";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-ExtraLightItalic.ttf?raw=true";
      name = "Barlow-ExtraLightItalic.ttf";
      sha256 = "8501cb7dafc8a5941fa559854a2e53ca8220bb27be29071e7b5767240dac177f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-Light.ttf?raw=true";
      name = "Barlow-Light.ttf";
      sha256 = "20b1375c0c6606701867bf34c7cc97f44087850567a36587d25abb9510b183cc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-LightItalic.ttf?raw=true";
      name = "Barlow-LightItalic.ttf";
      sha256 = "567f200fdd53e848cc5966f8bf3fe5aefc6eb5a5f15149a47412777b8cc4c203";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-Regular.ttf?raw=true";
      name = "Barlow-Regular.ttf";
      sha256 = "95aa02c7c43096e0dd44d787ba6216864a67157e402adab59b35572e0c1577ea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-Italic.ttf?raw=true";
      name = "Barlow-Italic.ttf";
      sha256 = "70cf45c354af39e55082fd506e748cc6a0a1812949875f99ded3f76bf691e4ca";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-Medium.ttf?raw=true";
      name = "Barlow-Medium.ttf";
      sha256 = "f8906f762cb73dca441da034bc363b2d8e2e68bc10d5c05e58717646c20cc4b4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-MediumItalic.ttf?raw=true";
      name = "Barlow-MediumItalic.ttf";
      sha256 = "dbf6d2df1348c4a91874a15bbe7b3f3d893d491bd2ae73370795afe157c993b9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-SemiBold.ttf?raw=true";
      name = "Barlow-SemiBold.ttf";
      sha256 = "86577cb32f8abe3673db53ca0f4221e6856751a4f6730c867e00f720f8bb1fc5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-SemiBoldItalic.ttf?raw=true";
      name = "Barlow-SemiBoldItalic.ttf";
      sha256 = "277b45fc0b9f066bf77e88e5d147baae8d1ad7441cedee1dc305fc3dc6e84ce7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-Bold.ttf?raw=true";
      name = "Barlow-Bold.ttf";
      sha256 = "84e6a4d61e7c3e21f3c50ea6a4f7e5303a3467864c038be6ea3759bab8d547f9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-BoldItalic.ttf?raw=true";
      name = "Barlow-BoldItalic.ttf";
      sha256 = "079dcee4a53544177f3b16354b27b40b521e22861a40084ab4d052f0289ed9e8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-ExtraBold.ttf?raw=true";
      name = "Barlow-ExtraBold.ttf";
      sha256 = "5234d91030e1bb89525cbaccc4386892c3fe005a0582c705264ce3572d96a1a1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-ExtraBoldItalic.ttf?raw=true";
      name = "Barlow-ExtraBoldItalic.ttf";
      sha256 = "5a78d6f6b7281ac38af2479d87209712457a91478019f9542abfd78fe8bdb332";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-Black.ttf?raw=true";
      name = "Barlow-Black.ttf";
      sha256 = "fc4f74e8475b181003f7597450c62d630622b417e367a6842972b286c49f9440";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlow/Barlow-BlackItalic.ttf?raw=true";
      name = "Barlow-BlackItalic.ttf";
      sha256 = "109ad3b4fff5bfd338d0fbc908e68d601893b97b9b1d8ae698aaab2209f6a618";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Barlow-Thin.ttf $out/share/fonts/truetype/Barlow-Thin.ttf
     install -Dm644 Barlow-ThinItalic.ttf $out/share/fonts/truetype/Barlow-ThinItalic.ttf
     install -Dm644 Barlow-ExtraLight.ttf $out/share/fonts/truetype/Barlow-ExtraLight.ttf
     install -Dm644 Barlow-ExtraLightItalic.ttf $out/share/fonts/truetype/Barlow-ExtraLightItalic.ttf
     install -Dm644 Barlow-Light.ttf $out/share/fonts/truetype/Barlow-Light.ttf
     install -Dm644 Barlow-LightItalic.ttf $out/share/fonts/truetype/Barlow-LightItalic.ttf
     install -Dm644 Barlow-Regular.ttf $out/share/fonts/truetype/Barlow-Regular.ttf
     install -Dm644 Barlow-Italic.ttf $out/share/fonts/truetype/Barlow-Italic.ttf
     install -Dm644 Barlow-Medium.ttf $out/share/fonts/truetype/Barlow-Medium.ttf
     install -Dm644 Barlow-MediumItalic.ttf $out/share/fonts/truetype/Barlow-MediumItalic.ttf
     install -Dm644 Barlow-SemiBold.ttf $out/share/fonts/truetype/Barlow-SemiBold.ttf
     install -Dm644 Barlow-SemiBoldItalic.ttf $out/share/fonts/truetype/Barlow-SemiBoldItalic.ttf
     install -Dm644 Barlow-Bold.ttf $out/share/fonts/truetype/Barlow-Bold.ttf
     install -Dm644 Barlow-BoldItalic.ttf $out/share/fonts/truetype/Barlow-BoldItalic.ttf
     install -Dm644 Barlow-ExtraBold.ttf $out/share/fonts/truetype/Barlow-ExtraBold.ttf
     install -Dm644 Barlow-ExtraBoldItalic.ttf $out/share/fonts/truetype/Barlow-ExtraBoldItalic.ttf
     install -Dm644 Barlow-Black.ttf $out/share/fonts/truetype/Barlow-Black.ttf
     install -Dm644 Barlow-BlackItalic.ttf $out/share/fonts/truetype/Barlow-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Barlow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
