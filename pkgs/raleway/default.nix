{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "raleway-${version}";
  version = "2016-02-06-004945";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-Thin.ttf?raw=true";
      name = "Raleway-Thin.ttf";
      sha256 = "59ee38a0d6f119171f896098603246f2bfc5780d75d23c3298b66a03b45d32db";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-ThinItalic.ttf?raw=true";
      name = "Raleway-ThinItalic.ttf";
      sha256 = "961a831acb582dbc3ed7d79dc991118d60238c8683c50584e126a293a881264f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-ExtraLight.ttf?raw=true";
      name = "Raleway-ExtraLight.ttf";
      sha256 = "2620b63bff6f16fb1fa5e28209777cfdfc51a0c8aa1d54ea24a590541e2fd54f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-ExtraLightItalic.ttf?raw=true";
      name = "Raleway-ExtraLightItalic.ttf";
      sha256 = "02e952d32fc8fe96cddd4c3350d4a809f151e105de14d935974c9a19f3b6bac5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-Light.ttf?raw=true";
      name = "Raleway-Light.ttf";
      sha256 = "b3d8986142d28fd27c5158b5d24b072bbed301b1763fe0bfe3076a631e8ea0ca";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-LightItalic.ttf?raw=true";
      name = "Raleway-LightItalic.ttf";
      sha256 = "c767a43c0012cdcb76e32f2f3b5005e054ba60fcf52653f7c456f0044e14f1d3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-Regular.ttf?raw=true";
      name = "Raleway-Regular.ttf";
      sha256 = "20e4ae409ffbe8bfd2af14d7f717398408ae8b481005beccb83d62ef4052b681";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-Italic.ttf?raw=true";
      name = "Raleway-Italic.ttf";
      sha256 = "f9c5e089b4bb57662171cc7120e1dcae8d66432b4447dd7a7babb0c5e06aa93e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-Medium.ttf?raw=true";
      name = "Raleway-Medium.ttf";
      sha256 = "3d8a045b2c853ee51e5d734d3b53eacf3f5f5290d6b5b862134af53b29dd6818";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-MediumItalic.ttf?raw=true";
      name = "Raleway-MediumItalic.ttf";
      sha256 = "f7ac99eee53833254c89097c36ec68c0de390377cd31b4c1c082ec3b0132862e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-SemiBold.ttf?raw=true";
      name = "Raleway-SemiBold.ttf";
      sha256 = "b7680f30199f65ce3b2620713f7cb27a175560ea7402e0b4cba01c5d54508a17";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-SemiBoldItalic.ttf?raw=true";
      name = "Raleway-SemiBoldItalic.ttf";
      sha256 = "b8d486395fa65b66cb63321cb4a277d51035fe4d0bd9b49edf8322ea9d55c42c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-Bold.ttf?raw=true";
      name = "Raleway-Bold.ttf";
      sha256 = "ca9de8b3be7ccd4b80774a9c7dd56a98c49c276771c5957729b5958d1d579112";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-BoldItalic.ttf?raw=true";
      name = "Raleway-BoldItalic.ttf";
      sha256 = "647fb029a65c0cd0b5a64a1d178ee4e118731e963cb1ef62cf24427b8b251c2a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-ExtraBold.ttf?raw=true";
      name = "Raleway-ExtraBold.ttf";
      sha256 = "a89c06c1793eb0b173c2101744cf53ea66f8b24b360f5aef7649f6f2b7120e9e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-ExtraBoldItalic.ttf?raw=true";
      name = "Raleway-ExtraBoldItalic.ttf";
      sha256 = "43ee1a9aabfef25012cdfd38d683760f7e9c9e5d90adfb02125b4e1b602c7e6c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-Black.ttf?raw=true";
      name = "Raleway-Black.ttf";
      sha256 = "5d2aec83bf60483dc15a92e393a12be3f19245e82fa913c3a55df4dd810c405c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78978169aecd5086a7bc883e1800dba751063b00/ofl/raleway/Raleway-BlackItalic.ttf?raw=true";
      name = "Raleway-BlackItalic.ttf";
      sha256 = "e0f379b4e2f8d735fa6b189a1d095c17a11e5ab9fd755c87fc6bb64f3779b801";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Raleway-Thin.ttf $out/share/fonts/truetype/Raleway-Thin.ttf
     install -Dm644 Raleway-ThinItalic.ttf $out/share/fonts/truetype/Raleway-ThinItalic.ttf
     install -Dm644 Raleway-ExtraLight.ttf $out/share/fonts/truetype/Raleway-ExtraLight.ttf
     install -Dm644 Raleway-ExtraLightItalic.ttf $out/share/fonts/truetype/Raleway-ExtraLightItalic.ttf
     install -Dm644 Raleway-Light.ttf $out/share/fonts/truetype/Raleway-Light.ttf
     install -Dm644 Raleway-LightItalic.ttf $out/share/fonts/truetype/Raleway-LightItalic.ttf
     install -Dm644 Raleway-Regular.ttf $out/share/fonts/truetype/Raleway-Regular.ttf
     install -Dm644 Raleway-Italic.ttf $out/share/fonts/truetype/Raleway-Italic.ttf
     install -Dm644 Raleway-Medium.ttf $out/share/fonts/truetype/Raleway-Medium.ttf
     install -Dm644 Raleway-MediumItalic.ttf $out/share/fonts/truetype/Raleway-MediumItalic.ttf
     install -Dm644 Raleway-SemiBold.ttf $out/share/fonts/truetype/Raleway-SemiBold.ttf
     install -Dm644 Raleway-SemiBoldItalic.ttf $out/share/fonts/truetype/Raleway-SemiBoldItalic.ttf
     install -Dm644 Raleway-Bold.ttf $out/share/fonts/truetype/Raleway-Bold.ttf
     install -Dm644 Raleway-BoldItalic.ttf $out/share/fonts/truetype/Raleway-BoldItalic.ttf
     install -Dm644 Raleway-ExtraBold.ttf $out/share/fonts/truetype/Raleway-ExtraBold.ttf
     install -Dm644 Raleway-ExtraBoldItalic.ttf $out/share/fonts/truetype/Raleway-ExtraBoldItalic.ttf
     install -Dm644 Raleway-Black.ttf $out/share/fonts/truetype/Raleway-Black.ttf
     install -Dm644 Raleway-BlackItalic.ttf $out/share/fonts/truetype/Raleway-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Raleway";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
