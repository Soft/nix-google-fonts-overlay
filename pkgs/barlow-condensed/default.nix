{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "barlow-condensed-${version}";
  version = "2018-12-05-153357";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-Thin.ttf?raw=true";
      name = "BarlowCondensed-Thin.ttf";
      sha256 = "68afe339b8503a9d74b2c3b5b0c521ea5333461f29aeaf7c680141482114d85a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-ThinItalic.ttf?raw=true";
      name = "BarlowCondensed-ThinItalic.ttf";
      sha256 = "5b0ff874e3ae64e2b3dc2c761d8ba2eb3eae324d269441f6de0062e8fbff0b8e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-ExtraLight.ttf?raw=true";
      name = "BarlowCondensed-ExtraLight.ttf";
      sha256 = "19e3c4a81dc7fcee8c38ab6be3819fcc45d3f3822f011ac7b4bd550e6502b80f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-ExtraLightItalic.ttf?raw=true";
      name = "BarlowCondensed-ExtraLightItalic.ttf";
      sha256 = "a58c17c59c226eb0ef411b73696f79374d170f2708acc6d72d8db8c07f333286";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-Light.ttf?raw=true";
      name = "BarlowCondensed-Light.ttf";
      sha256 = "2c37e1e6b5feb71d38a42e6180d2e2f4ca1aad22cfecbd017430f3863deba67d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-LightItalic.ttf?raw=true";
      name = "BarlowCondensed-LightItalic.ttf";
      sha256 = "14aabc4936c54a3aae666abccbc4be612e4a33501c9483f7e4ebb249359d0171";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-Regular.ttf?raw=true";
      name = "BarlowCondensed-Regular.ttf";
      sha256 = "583cec5da3b84bc4dc7c9c72e2a565c94d34e431518b19d7e250b7830ad5f996";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-Italic.ttf?raw=true";
      name = "BarlowCondensed-Italic.ttf";
      sha256 = "063615da0a64f318397de2afac330dfbfbbf4cdb562a9987cb72bfdcbd37ba7c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-Medium.ttf?raw=true";
      name = "BarlowCondensed-Medium.ttf";
      sha256 = "262bd143292ce479ee0cd09a42b47ab173fca8e9c6eb5ed0b5c8a845bc371d17";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-MediumItalic.ttf?raw=true";
      name = "BarlowCondensed-MediumItalic.ttf";
      sha256 = "e036488bfe3ea1e9f39f006b1237c2931e7cfea7d9ecdccdf17507a5986f73d9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-SemiBold.ttf?raw=true";
      name = "BarlowCondensed-SemiBold.ttf";
      sha256 = "7b619d14bc2327509a9ef32b0890f709626f7ecc9ff61191c2a4314c5499d2d9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-SemiBoldItalic.ttf?raw=true";
      name = "BarlowCondensed-SemiBoldItalic.ttf";
      sha256 = "dc83cbbb7545a117ab9e4c10ed07d35eef6f563b77621a1d357f25a3194987d1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-Bold.ttf?raw=true";
      name = "BarlowCondensed-Bold.ttf";
      sha256 = "e476562ec9c1e16cf16475895b511f08c804f438cc9a9f80a44ea50a0eeb5b65";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-BoldItalic.ttf?raw=true";
      name = "BarlowCondensed-BoldItalic.ttf";
      sha256 = "d8694f65cd70c3e5e600ead37657aab0adb5f63b275d0c1f6f4a7046de222145";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-ExtraBold.ttf?raw=true";
      name = "BarlowCondensed-ExtraBold.ttf";
      sha256 = "724c9c25952d5f4a2d87185d9767aa006144c5f0d944dc05bf7d5d603551c260";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-ExtraBoldItalic.ttf?raw=true";
      name = "BarlowCondensed-ExtraBoldItalic.ttf";
      sha256 = "331783dae9ec0c398f4d32c9fd5a56d4c602caa0c1628c2b9cbfe93f48eb68c9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-Black.ttf?raw=true";
      name = "BarlowCondensed-Black.ttf";
      sha256 = "e74b750df582c608f35db467b711b2b60d2217618e85e60b72b42dfd00446cab";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowcondensed/BarlowCondensed-BlackItalic.ttf?raw=true";
      name = "BarlowCondensed-BlackItalic.ttf";
      sha256 = "e1ed5d7e50c6a4498454d40509ce2362384a2c7870df3418fdbd010f81dffad3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BarlowCondensed-Thin.ttf $out/share/fonts/truetype/BarlowCondensed-Thin.ttf
     install -Dm644 BarlowCondensed-ThinItalic.ttf $out/share/fonts/truetype/BarlowCondensed-ThinItalic.ttf
     install -Dm644 BarlowCondensed-ExtraLight.ttf $out/share/fonts/truetype/BarlowCondensed-ExtraLight.ttf
     install -Dm644 BarlowCondensed-ExtraLightItalic.ttf $out/share/fonts/truetype/BarlowCondensed-ExtraLightItalic.ttf
     install -Dm644 BarlowCondensed-Light.ttf $out/share/fonts/truetype/BarlowCondensed-Light.ttf
     install -Dm644 BarlowCondensed-LightItalic.ttf $out/share/fonts/truetype/BarlowCondensed-LightItalic.ttf
     install -Dm644 BarlowCondensed-Regular.ttf $out/share/fonts/truetype/BarlowCondensed-Regular.ttf
     install -Dm644 BarlowCondensed-Italic.ttf $out/share/fonts/truetype/BarlowCondensed-Italic.ttf
     install -Dm644 BarlowCondensed-Medium.ttf $out/share/fonts/truetype/BarlowCondensed-Medium.ttf
     install -Dm644 BarlowCondensed-MediumItalic.ttf $out/share/fonts/truetype/BarlowCondensed-MediumItalic.ttf
     install -Dm644 BarlowCondensed-SemiBold.ttf $out/share/fonts/truetype/BarlowCondensed-SemiBold.ttf
     install -Dm644 BarlowCondensed-SemiBoldItalic.ttf $out/share/fonts/truetype/BarlowCondensed-SemiBoldItalic.ttf
     install -Dm644 BarlowCondensed-Bold.ttf $out/share/fonts/truetype/BarlowCondensed-Bold.ttf
     install -Dm644 BarlowCondensed-BoldItalic.ttf $out/share/fonts/truetype/BarlowCondensed-BoldItalic.ttf
     install -Dm644 BarlowCondensed-ExtraBold.ttf $out/share/fonts/truetype/BarlowCondensed-ExtraBold.ttf
     install -Dm644 BarlowCondensed-ExtraBoldItalic.ttf $out/share/fonts/truetype/BarlowCondensed-ExtraBoldItalic.ttf
     install -Dm644 BarlowCondensed-Black.ttf $out/share/fonts/truetype/BarlowCondensed-Black.ttf
     install -Dm644 BarlowCondensed-BlackItalic.ttf $out/share/fonts/truetype/BarlowCondensed-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Barlow Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
