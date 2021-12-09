{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fahkwang-${version}";
  version = "2018-09-07-134900";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/df66d8a06f02acf3efecf389ae1960658ad887ff/ofl/fahkwang/Fahkwang-ExtraLight.ttf?raw=true";
      name = "Fahkwang-ExtraLight.ttf";
      sha256 = "abf6583c1f8f05e9a053e2cf3832e4a2859d28777da0d45232fcec519055d0ca";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/df66d8a06f02acf3efecf389ae1960658ad887ff/ofl/fahkwang/Fahkwang-ExtraLightItalic.ttf?raw=true";
      name = "Fahkwang-ExtraLightItalic.ttf";
      sha256 = "c03eba5baf576d98216027a1b0eedc4035dc13ce7af1d44316d80538bca50c1a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/df66d8a06f02acf3efecf389ae1960658ad887ff/ofl/fahkwang/Fahkwang-Light.ttf?raw=true";
      name = "Fahkwang-Light.ttf";
      sha256 = "2ac5586f842987801e5f4a391e6cf0c9d2f26e53b8a3bc2442a7640127fda02b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/df66d8a06f02acf3efecf389ae1960658ad887ff/ofl/fahkwang/Fahkwang-LightItalic.ttf?raw=true";
      name = "Fahkwang-LightItalic.ttf";
      sha256 = "eff441c47bdef712477f4ecc9fbe8c9663551bccca1f158b1674dc7df668544a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/df66d8a06f02acf3efecf389ae1960658ad887ff/ofl/fahkwang/Fahkwang-Regular.ttf?raw=true";
      name = "Fahkwang-Regular.ttf";
      sha256 = "ce596ef9da1e40d894a1f6dbaca54aab3c699763e2715a649a8146e6ef32fb2b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/df66d8a06f02acf3efecf389ae1960658ad887ff/ofl/fahkwang/Fahkwang-Italic.ttf?raw=true";
      name = "Fahkwang-Italic.ttf";
      sha256 = "7455131628894aba848b3fe9ba8c2fa99f6cbc41f52391934e630a4aa8860fab";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/df66d8a06f02acf3efecf389ae1960658ad887ff/ofl/fahkwang/Fahkwang-Medium.ttf?raw=true";
      name = "Fahkwang-Medium.ttf";
      sha256 = "050aba7762b61b85f3392423adbe221b71c854312ccb548709c4bc61e4518741";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/df66d8a06f02acf3efecf389ae1960658ad887ff/ofl/fahkwang/Fahkwang-MediumItalic.ttf?raw=true";
      name = "Fahkwang-MediumItalic.ttf";
      sha256 = "0404d0e69c5f21f8be5b65fc2c215ee08c7de9ee89473801c17fb1a5e95a5da6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/df66d8a06f02acf3efecf389ae1960658ad887ff/ofl/fahkwang/Fahkwang-SemiBold.ttf?raw=true";
      name = "Fahkwang-SemiBold.ttf";
      sha256 = "3c8eaee7f138efe3b2925571f8d9af9275af25662a2a8baddf0dc3af2790fde3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/df66d8a06f02acf3efecf389ae1960658ad887ff/ofl/fahkwang/Fahkwang-SemiBoldItalic.ttf?raw=true";
      name = "Fahkwang-SemiBoldItalic.ttf";
      sha256 = "6662235fa26919dccdb65697cc4a664814e1dca57498c168b9e24a0948a8a497";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/df66d8a06f02acf3efecf389ae1960658ad887ff/ofl/fahkwang/Fahkwang-Bold.ttf?raw=true";
      name = "Fahkwang-Bold.ttf";
      sha256 = "f44512b78dae665290e0bcbc0b5198462694c894d3300019b69a30d87341f042";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/df66d8a06f02acf3efecf389ae1960658ad887ff/ofl/fahkwang/Fahkwang-BoldItalic.ttf?raw=true";
      name = "Fahkwang-BoldItalic.ttf";
      sha256 = "607383c7dece1337b2bb573a09136223addc8a54d5e0a34dcd146280052c4805";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fahkwang-ExtraLight.ttf $out/share/fonts/truetype/Fahkwang-ExtraLight.ttf
     install -Dm644 Fahkwang-ExtraLightItalic.ttf $out/share/fonts/truetype/Fahkwang-ExtraLightItalic.ttf
     install -Dm644 Fahkwang-Light.ttf $out/share/fonts/truetype/Fahkwang-Light.ttf
     install -Dm644 Fahkwang-LightItalic.ttf $out/share/fonts/truetype/Fahkwang-LightItalic.ttf
     install -Dm644 Fahkwang-Regular.ttf $out/share/fonts/truetype/Fahkwang-Regular.ttf
     install -Dm644 Fahkwang-Italic.ttf $out/share/fonts/truetype/Fahkwang-Italic.ttf
     install -Dm644 Fahkwang-Medium.ttf $out/share/fonts/truetype/Fahkwang-Medium.ttf
     install -Dm644 Fahkwang-MediumItalic.ttf $out/share/fonts/truetype/Fahkwang-MediumItalic.ttf
     install -Dm644 Fahkwang-SemiBold.ttf $out/share/fonts/truetype/Fahkwang-SemiBold.ttf
     install -Dm644 Fahkwang-SemiBoldItalic.ttf $out/share/fonts/truetype/Fahkwang-SemiBoldItalic.ttf
     install -Dm644 Fahkwang-Bold.ttf $out/share/fonts/truetype/Fahkwang-Bold.ttf
     install -Dm644 Fahkwang-BoldItalic.ttf $out/share/fonts/truetype/Fahkwang-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Fahkwang";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
