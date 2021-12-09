{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "taviraj-${version}";
  version = "2017-05-16-161609";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-Thin.ttf?raw=true";
      name = "Taviraj-Thin.ttf";
      sha256 = "3bbc37644f9eda2475bd5627798b0d97c765cf668297973a21fe8266c351071e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-ThinItalic.ttf?raw=true";
      name = "Taviraj-ThinItalic.ttf";
      sha256 = "4180da968771442706c2a88b034d04defcf71e5fe15b835c0d7e4e1cd4252322";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-ExtraLight.ttf?raw=true";
      name = "Taviraj-ExtraLight.ttf";
      sha256 = "79cc55234fc8b85121bb3e4563dd8e35af7c805d438ece34d484f7066da8b00e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-ExtraLightItalic.ttf?raw=true";
      name = "Taviraj-ExtraLightItalic.ttf";
      sha256 = "e59c5c8aee9545014a90a8c00b5f974ab1078f0635a3bdff65a2ca7ac3bf47b7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-Light.ttf?raw=true";
      name = "Taviraj-Light.ttf";
      sha256 = "57670abb418f67f90031eb073e7afb69d98e041b7ef824a0d68981104f13beed";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-LightItalic.ttf?raw=true";
      name = "Taviraj-LightItalic.ttf";
      sha256 = "9ea582249b84f20f3bd7a5d782de86abf86ecfaddf2120445e0ce1d199e6c8ee";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-Regular.ttf?raw=true";
      name = "Taviraj-Regular.ttf";
      sha256 = "077e6299711fddca973f9d43455949018459c2d29c6e790666d41017ee1a27d5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-Italic.ttf?raw=true";
      name = "Taviraj-Italic.ttf";
      sha256 = "fa1cc9f894d97f4a40a0b02438dc3b515570e7d3db296d2a503ba3d32cc6c613";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-Medium.ttf?raw=true";
      name = "Taviraj-Medium.ttf";
      sha256 = "126a0ed061ff96c499b314bdcdacfa1c2ccd153fcd78e4fbb3575c88e98dae3d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-MediumItalic.ttf?raw=true";
      name = "Taviraj-MediumItalic.ttf";
      sha256 = "d4d395f9cad1b34c290eba6c93da85ea99a90e8ba5884adf7a4504ffcf0b8033";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-SemiBold.ttf?raw=true";
      name = "Taviraj-SemiBold.ttf";
      sha256 = "7f4780e18a823b464421ac2da16b190ce3cf6177e78145a1005228efddbe622c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-SemiBoldItalic.ttf?raw=true";
      name = "Taviraj-SemiBoldItalic.ttf";
      sha256 = "fb1d37bd556db119d4b46e26f22bf668cbacbab20ed3748170090a16b9a750fa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-Bold.ttf?raw=true";
      name = "Taviraj-Bold.ttf";
      sha256 = "ece5631dc38d8a229148ec87830fa10aa4ba8d8641c719ea25eef2c37474ba21";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-BoldItalic.ttf?raw=true";
      name = "Taviraj-BoldItalic.ttf";
      sha256 = "30d45de52374cec3a07e602841e7aadbf45316fcd5bb8191bf9c2337c7175aab";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-ExtraBold.ttf?raw=true";
      name = "Taviraj-ExtraBold.ttf";
      sha256 = "964ba956d8953ac4242471d7f20c898c266c8f2cf7c983a51008be0acfb3ef19";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-ExtraBoldItalic.ttf?raw=true";
      name = "Taviraj-ExtraBoldItalic.ttf";
      sha256 = "1eed5bf0b32cd8d7123b81fc190d1a2695199e2752ef0716b6675aa1e80e9a87";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-Black.ttf?raw=true";
      name = "Taviraj-Black.ttf";
      sha256 = "81f3c81155733a73c4b5914d7d6857832e7dcad5b5e63f7992d797907e327a17";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097f5a9a35829ecfb159c266260422aa456ea27f/ofl/taviraj/Taviraj-BlackItalic.ttf?raw=true";
      name = "Taviraj-BlackItalic.ttf";
      sha256 = "33b178920c742a79fc5dab4b55585b61ea0a099ce152c8fabaddccc2f8be11e8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Taviraj-Thin.ttf $out/share/fonts/truetype/Taviraj-Thin.ttf
     install -Dm644 Taviraj-ThinItalic.ttf $out/share/fonts/truetype/Taviraj-ThinItalic.ttf
     install -Dm644 Taviraj-ExtraLight.ttf $out/share/fonts/truetype/Taviraj-ExtraLight.ttf
     install -Dm644 Taviraj-ExtraLightItalic.ttf $out/share/fonts/truetype/Taviraj-ExtraLightItalic.ttf
     install -Dm644 Taviraj-Light.ttf $out/share/fonts/truetype/Taviraj-Light.ttf
     install -Dm644 Taviraj-LightItalic.ttf $out/share/fonts/truetype/Taviraj-LightItalic.ttf
     install -Dm644 Taviraj-Regular.ttf $out/share/fonts/truetype/Taviraj-Regular.ttf
     install -Dm644 Taviraj-Italic.ttf $out/share/fonts/truetype/Taviraj-Italic.ttf
     install -Dm644 Taviraj-Medium.ttf $out/share/fonts/truetype/Taviraj-Medium.ttf
     install -Dm644 Taviraj-MediumItalic.ttf $out/share/fonts/truetype/Taviraj-MediumItalic.ttf
     install -Dm644 Taviraj-SemiBold.ttf $out/share/fonts/truetype/Taviraj-SemiBold.ttf
     install -Dm644 Taviraj-SemiBoldItalic.ttf $out/share/fonts/truetype/Taviraj-SemiBoldItalic.ttf
     install -Dm644 Taviraj-Bold.ttf $out/share/fonts/truetype/Taviraj-Bold.ttf
     install -Dm644 Taviraj-BoldItalic.ttf $out/share/fonts/truetype/Taviraj-BoldItalic.ttf
     install -Dm644 Taviraj-ExtraBold.ttf $out/share/fonts/truetype/Taviraj-ExtraBold.ttf
     install -Dm644 Taviraj-ExtraBoldItalic.ttf $out/share/fonts/truetype/Taviraj-ExtraBoldItalic.ttf
     install -Dm644 Taviraj-Black.ttf $out/share/fonts/truetype/Taviraj-Black.ttf
     install -Dm644 Taviraj-BlackItalic.ttf $out/share/fonts/truetype/Taviraj-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Taviraj";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
