{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "koho-${version}";
  version = "2018-09-07-135553";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d3f2f5e64f71ac9ab2fde5d3a7133508f4a4ea8/ofl/koho/KoHo-ExtraLight.ttf?raw=true";
      name = "KoHo-ExtraLight.ttf";
      sha256 = "de98ca80b3696c4b182bde204d63a30a5d4a071e4b7078f9433064bf3d24c478";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d3f2f5e64f71ac9ab2fde5d3a7133508f4a4ea8/ofl/koho/KoHo-ExtraLightItalic.ttf?raw=true";
      name = "KoHo-ExtraLightItalic.ttf";
      sha256 = "7237959faa377f413d3d10ded225217ab6aa60b1a554ebeae5222ae9adab0259";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d3f2f5e64f71ac9ab2fde5d3a7133508f4a4ea8/ofl/koho/KoHo-Light.ttf?raw=true";
      name = "KoHo-Light.ttf";
      sha256 = "5cfb9a15757cf45f5a0b1a37dc8cc0991a8f3f9570c74d8fcde9e66a940535c6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d3f2f5e64f71ac9ab2fde5d3a7133508f4a4ea8/ofl/koho/KoHo-LightItalic.ttf?raw=true";
      name = "KoHo-LightItalic.ttf";
      sha256 = "f15e5b6444466997bba7b40abde407863a94db89fb6a001e42524dac0cda7dcf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d3f2f5e64f71ac9ab2fde5d3a7133508f4a4ea8/ofl/koho/KoHo-Regular.ttf?raw=true";
      name = "KoHo-Regular.ttf";
      sha256 = "d9dfeb7f627c7ce3ed9437c8130504daf2644ece5f54a27b9f7930dbdd45ad30";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d3f2f5e64f71ac9ab2fde5d3a7133508f4a4ea8/ofl/koho/KoHo-Italic.ttf?raw=true";
      name = "KoHo-Italic.ttf";
      sha256 = "436be41906dc80786358d7546ed279b5051ffb3e10dab86154d0b100d89eb6a0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d3f2f5e64f71ac9ab2fde5d3a7133508f4a4ea8/ofl/koho/KoHo-Medium.ttf?raw=true";
      name = "KoHo-Medium.ttf";
      sha256 = "8c32e67f574b150164ff616209e8239192949bb18f3e94e01ac91fb5419286b9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d3f2f5e64f71ac9ab2fde5d3a7133508f4a4ea8/ofl/koho/KoHo-MediumItalic.ttf?raw=true";
      name = "KoHo-MediumItalic.ttf";
      sha256 = "14d8bba68904145404c88d6e1c0117b512f8d089340db4b56cc6616691f66400";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d3f2f5e64f71ac9ab2fde5d3a7133508f4a4ea8/ofl/koho/KoHo-SemiBold.ttf?raw=true";
      name = "KoHo-SemiBold.ttf";
      sha256 = "5396d7a25b9d571c6ba5505452c46dfda299513c4bfff9c727ac2c309ac0b84f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d3f2f5e64f71ac9ab2fde5d3a7133508f4a4ea8/ofl/koho/KoHo-SemiBoldItalic.ttf?raw=true";
      name = "KoHo-SemiBoldItalic.ttf";
      sha256 = "22be368fcf0a729d95fea1a66d35a3ceccf1390ab43d377bba12ed63390d3515";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d3f2f5e64f71ac9ab2fde5d3a7133508f4a4ea8/ofl/koho/KoHo-Bold.ttf?raw=true";
      name = "KoHo-Bold.ttf";
      sha256 = "ad66b62adef88839e0292bbf4a1dfb5d9345826a19a3ffd780d34f7bc669e1b1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d3f2f5e64f71ac9ab2fde5d3a7133508f4a4ea8/ofl/koho/KoHo-BoldItalic.ttf?raw=true";
      name = "KoHo-BoldItalic.ttf";
      sha256 = "e040183789349e09b44bd98058687e59793cd8cda5c3b2aa6d3c7fa4319a37f0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KoHo-ExtraLight.ttf $out/share/fonts/truetype/KoHo-ExtraLight.ttf
     install -Dm644 KoHo-ExtraLightItalic.ttf $out/share/fonts/truetype/KoHo-ExtraLightItalic.ttf
     install -Dm644 KoHo-Light.ttf $out/share/fonts/truetype/KoHo-Light.ttf
     install -Dm644 KoHo-LightItalic.ttf $out/share/fonts/truetype/KoHo-LightItalic.ttf
     install -Dm644 KoHo-Regular.ttf $out/share/fonts/truetype/KoHo-Regular.ttf
     install -Dm644 KoHo-Italic.ttf $out/share/fonts/truetype/KoHo-Italic.ttf
     install -Dm644 KoHo-Medium.ttf $out/share/fonts/truetype/KoHo-Medium.ttf
     install -Dm644 KoHo-MediumItalic.ttf $out/share/fonts/truetype/KoHo-MediumItalic.ttf
     install -Dm644 KoHo-SemiBold.ttf $out/share/fonts/truetype/KoHo-SemiBold.ttf
     install -Dm644 KoHo-SemiBoldItalic.ttf $out/share/fonts/truetype/KoHo-SemiBoldItalic.ttf
     install -Dm644 KoHo-Bold.ttf $out/share/fonts/truetype/KoHo-Bold.ttf
     install -Dm644 KoHo-BoldItalic.ttf $out/share/fonts/truetype/KoHo-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "KoHo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
