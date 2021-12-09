{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "podkova-${version}";
  version = "2017-02-07-174023";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bee0af74096f3f90ae6396bfb0287d85a9980d80/ofl/podkova/Podkova-Regular.ttf?raw=true";
      name = "Podkova-Regular.ttf";
      sha256 = "bdfd0acf4241fb9916fc9613bc56616300c72721b4116c3202d65c1c0b272bcd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bee0af74096f3f90ae6396bfb0287d85a9980d80/ofl/podkova/Podkova-Medium.ttf?raw=true";
      name = "Podkova-Medium.ttf";
      sha256 = "a2abd0d351c7b48d4b7174651bd97e947a142a7754ff0066e034378d2a8a171f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bee0af74096f3f90ae6396bfb0287d85a9980d80/ofl/podkova/Podkova-SemiBold.ttf?raw=true";
      name = "Podkova-SemiBold.ttf";
      sha256 = "33eca8e359d1660149499a2dc6edeafa4bfc346c2bf40147c54bb67114a4dbf2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bee0af74096f3f90ae6396bfb0287d85a9980d80/ofl/podkova/Podkova-Bold.ttf?raw=true";
      name = "Podkova-Bold.ttf";
      sha256 = "f9de7e35da916393437f94e1314b1b5512b86932521cda83592774f09ee2fc6c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bee0af74096f3f90ae6396bfb0287d85a9980d80/ofl/podkova/Podkova-ExtraBold.ttf?raw=true";
      name = "Podkova-ExtraBold.ttf";
      sha256 = "ca1c7de2955e36c813bfbd82e3f97939929dfcba2c7423f848f5f65511e87159";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Podkova-Regular.ttf $out/share/fonts/truetype/Podkova-Regular.ttf
     install -Dm644 Podkova-Medium.ttf $out/share/fonts/truetype/Podkova-Medium.ttf
     install -Dm644 Podkova-SemiBold.ttf $out/share/fonts/truetype/Podkova-SemiBold.ttf
     install -Dm644 Podkova-Bold.ttf $out/share/fonts/truetype/Podkova-Bold.ttf
     install -Dm644 Podkova-ExtraBold.ttf $out/share/fonts/truetype/Podkova-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Podkova";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
