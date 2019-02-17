{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "encode-sans-expanded-${version}";
  version = "2017-02-07-175213";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9fa50aeeaa1434182f99bd66258a7adfba1dfe1b/ofl/encodesansexpanded/EncodeSansExpanded-Thin.ttf?raw=true";
      name = "EncodeSansExpanded-Thin.ttf";
      sha256 = "4953ce70b2d7fcb29c01cec357b7c88b5c075d690760542ea1ca7ad097f09fb2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9fa50aeeaa1434182f99bd66258a7adfba1dfe1b/ofl/encodesansexpanded/EncodeSansExpanded-ExtraLight.ttf?raw=true";
      name = "EncodeSansExpanded-ExtraLight.ttf";
      sha256 = "f0c3a58ec4fd670dc6ad5bd000d15980967bb4ae64a1fa118e7d17363e9873b1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9fa50aeeaa1434182f99bd66258a7adfba1dfe1b/ofl/encodesansexpanded/EncodeSansExpanded-Light.ttf?raw=true";
      name = "EncodeSansExpanded-Light.ttf";
      sha256 = "ab53ca3cdd5b90ae9803cbef6cab0c20b8080babb3a7f54505512e39633a6f99";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9fa50aeeaa1434182f99bd66258a7adfba1dfe1b/ofl/encodesansexpanded/EncodeSansExpanded-Regular.ttf?raw=true";
      name = "EncodeSansExpanded-Regular.ttf";
      sha256 = "525f758bf7d5e5634e459e63d4a8575ca585e2eeed4bec26e2d3e925a266c6ee";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9fa50aeeaa1434182f99bd66258a7adfba1dfe1b/ofl/encodesansexpanded/EncodeSansExpanded-Medium.ttf?raw=true";
      name = "EncodeSansExpanded-Medium.ttf";
      sha256 = "1394caa3b6da26947b37d0200d02b7f77bf4d63ab4befca5b5f1deef0c53d284";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9fa50aeeaa1434182f99bd66258a7adfba1dfe1b/ofl/encodesansexpanded/EncodeSansExpanded-SemiBold.ttf?raw=true";
      name = "EncodeSansExpanded-SemiBold.ttf";
      sha256 = "98556bc8405b72ab5cb95cafeadd6eec27cff492a7c828c2ac4ef2f3fff5105b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9fa50aeeaa1434182f99bd66258a7adfba1dfe1b/ofl/encodesansexpanded/EncodeSansExpanded-Bold.ttf?raw=true";
      name = "EncodeSansExpanded-Bold.ttf";
      sha256 = "01487641e16fd85a457c111d9488a1a1009037437a04b1d318cec51c00282ae5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9fa50aeeaa1434182f99bd66258a7adfba1dfe1b/ofl/encodesansexpanded/EncodeSansExpanded-ExtraBold.ttf?raw=true";
      name = "EncodeSansExpanded-ExtraBold.ttf";
      sha256 = "3bc82114be0fd076c27461cb2c5fdc67605844effe63e6042d7692c8fc4fd890";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9fa50aeeaa1434182f99bd66258a7adfba1dfe1b/ofl/encodesansexpanded/EncodeSansExpanded-Black.ttf?raw=true";
      name = "EncodeSansExpanded-Black.ttf";
      sha256 = "5653185aa0df87ebe848f5c76f71a76f6f94efa5d07acc87058c3a173ba30dac";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EncodeSansExpanded-Thin.ttf $out/share/fonts/truetype/EncodeSansExpanded-Thin.ttf
     install -Dm644 EncodeSansExpanded-ExtraLight.ttf $out/share/fonts/truetype/EncodeSansExpanded-ExtraLight.ttf
     install -Dm644 EncodeSansExpanded-Light.ttf $out/share/fonts/truetype/EncodeSansExpanded-Light.ttf
     install -Dm644 EncodeSansExpanded-Regular.ttf $out/share/fonts/truetype/EncodeSansExpanded-Regular.ttf
     install -Dm644 EncodeSansExpanded-Medium.ttf $out/share/fonts/truetype/EncodeSansExpanded-Medium.ttf
     install -Dm644 EncodeSansExpanded-SemiBold.ttf $out/share/fonts/truetype/EncodeSansExpanded-SemiBold.ttf
     install -Dm644 EncodeSansExpanded-Bold.ttf $out/share/fonts/truetype/EncodeSansExpanded-Bold.ttf
     install -Dm644 EncodeSansExpanded-ExtraBold.ttf $out/share/fonts/truetype/EncodeSansExpanded-ExtraBold.ttf
     install -Dm644 EncodeSansExpanded-Black.ttf $out/share/fonts/truetype/EncodeSansExpanded-Black.ttf
  '';

  meta = with stdenv.lib; {
    description = "Encode Sans Expanded";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
