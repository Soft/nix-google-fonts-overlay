{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playfair-display-${version}";
  version = "2017-11-03-142618";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c778ad7561ec09bb553e6a6569d893b1cb52372f/ofl/playfairdisplay/PlayfairDisplay-Regular.ttf?raw=true";
      name = "PlayfairDisplay-Regular.ttf";
      sha256 = "844b4c3b02e307318abb61d8ebd55bfb8e19304515075fd8af06af099480191e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c778ad7561ec09bb553e6a6569d893b1cb52372f/ofl/playfairdisplay/PlayfairDisplay-Italic.ttf?raw=true";
      name = "PlayfairDisplay-Italic.ttf";
      sha256 = "f658325ffab1a9f9ce0bdcd2cfc2f7d6ac144bf92a49580eb70913732825a3e2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c778ad7561ec09bb553e6a6569d893b1cb52372f/ofl/playfairdisplay/PlayfairDisplay-Bold.ttf?raw=true";
      name = "PlayfairDisplay-Bold.ttf";
      sha256 = "37fcc00a7503976693088bed271e64ce34fca5119181da9acf5b74bd59da8c7e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c778ad7561ec09bb553e6a6569d893b1cb52372f/ofl/playfairdisplay/PlayfairDisplay-BoldItalic.ttf?raw=true";
      name = "PlayfairDisplay-BoldItalic.ttf";
      sha256 = "aa17c37411fc706e484f29591a86c5b15be51022cb7b33a3ce411274a7d9e9b5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c778ad7561ec09bb553e6a6569d893b1cb52372f/ofl/playfairdisplay/PlayfairDisplay-Black.ttf?raw=true";
      name = "PlayfairDisplay-Black.ttf";
      sha256 = "145f22e93511706943bb9f0af3496e70ec139e89c675a9c1543301634b11262f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c778ad7561ec09bb553e6a6569d893b1cb52372f/ofl/playfairdisplay/PlayfairDisplay-BlackItalic.ttf?raw=true";
      name = "PlayfairDisplay-BlackItalic.ttf";
      sha256 = "b9f4b47055adea18249253913994b06eba9c3c073c4ef3bf890732b5b433c13c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlayfairDisplay-Regular.ttf $out/share/fonts/truetype/PlayfairDisplay-Regular.ttf
     install -Dm644 PlayfairDisplay-Italic.ttf $out/share/fonts/truetype/PlayfairDisplay-Italic.ttf
     install -Dm644 PlayfairDisplay-Bold.ttf $out/share/fonts/truetype/PlayfairDisplay-Bold.ttf
     install -Dm644 PlayfairDisplay-BoldItalic.ttf $out/share/fonts/truetype/PlayfairDisplay-BoldItalic.ttf
     install -Dm644 PlayfairDisplay-Black.ttf $out/share/fonts/truetype/PlayfairDisplay-Black.ttf
     install -Dm644 PlayfairDisplay-BlackItalic.ttf $out/share/fonts/truetype/PlayfairDisplay-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Playfair Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
