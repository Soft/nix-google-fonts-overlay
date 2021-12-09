{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "archivo-${version}";
  version = "2017-08-07-210742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72adeb4d43257e7167023b3a78b8f8a75d7b68ce/ofl/archivo/Archivo-Regular.ttf?raw=true";
      name = "Archivo-Regular.ttf";
      sha256 = "e6367439bc228452738b751e716693e0ece28261f71286d0b0dbac6a5a85753d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72adeb4d43257e7167023b3a78b8f8a75d7b68ce/ofl/archivo/Archivo-Italic.ttf?raw=true";
      name = "Archivo-Italic.ttf";
      sha256 = "d94a1c01986f76ef48f9265d1a6834ea822c9d0cccb19c04dea5b21bf57b9623";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72adeb4d43257e7167023b3a78b8f8a75d7b68ce/ofl/archivo/Archivo-Medium.ttf?raw=true";
      name = "Archivo-Medium.ttf";
      sha256 = "d06bda4cbb42c2620a1df41b957770e446d3f85ce506aeccb73222ff6d911f19";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72adeb4d43257e7167023b3a78b8f8a75d7b68ce/ofl/archivo/Archivo-MediumItalic.ttf?raw=true";
      name = "Archivo-MediumItalic.ttf";
      sha256 = "0e1692d5d715ebdda7dc7df1e301df79b6858303c8073548310db2feb1487618";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72adeb4d43257e7167023b3a78b8f8a75d7b68ce/ofl/archivo/Archivo-SemiBold.ttf?raw=true";
      name = "Archivo-SemiBold.ttf";
      sha256 = "e067b2999683f7a0058138975e32739b78de2f8d2a1ba41284b23c8ed4fd0f40";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72adeb4d43257e7167023b3a78b8f8a75d7b68ce/ofl/archivo/Archivo-SemiBoldItalic.ttf?raw=true";
      name = "Archivo-SemiBoldItalic.ttf";
      sha256 = "29b5b1493eabfd4c50a8eca5e39d6f940ee5539104033bcc3db6ac1385e7916c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72adeb4d43257e7167023b3a78b8f8a75d7b68ce/ofl/archivo/Archivo-Bold.ttf?raw=true";
      name = "Archivo-Bold.ttf";
      sha256 = "f5ddb6ea0b2e4eba9d7c1aeaa3e9b37b58ef2ce89cea382ea97d8d8d274763e8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72adeb4d43257e7167023b3a78b8f8a75d7b68ce/ofl/archivo/Archivo-BoldItalic.ttf?raw=true";
      name = "Archivo-BoldItalic.ttf";
      sha256 = "538ad4036c7d4eabbd8b6bbb1748d3f1064d21a9273b699f14ca14f86b3373c6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Archivo-Regular.ttf $out/share/fonts/truetype/Archivo-Regular.ttf
     install -Dm644 Archivo-Italic.ttf $out/share/fonts/truetype/Archivo-Italic.ttf
     install -Dm644 Archivo-Medium.ttf $out/share/fonts/truetype/Archivo-Medium.ttf
     install -Dm644 Archivo-MediumItalic.ttf $out/share/fonts/truetype/Archivo-MediumItalic.ttf
     install -Dm644 Archivo-SemiBold.ttf $out/share/fonts/truetype/Archivo-SemiBold.ttf
     install -Dm644 Archivo-SemiBoldItalic.ttf $out/share/fonts/truetype/Archivo-SemiBoldItalic.ttf
     install -Dm644 Archivo-Bold.ttf $out/share/fonts/truetype/Archivo-Bold.ttf
     install -Dm644 Archivo-BoldItalic.ttf $out/share/fonts/truetype/Archivo-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Archivo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
