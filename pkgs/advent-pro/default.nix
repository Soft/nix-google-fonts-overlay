{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "advent-pro-${version}";
  version = "2017-09-27-040236";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b0e6a7fe53f6ec45f60cc4c2598732dea29d56fc/ofl/adventpro/AdventPro-Thin.ttf?raw=true";
      name = "AdventPro-Thin.ttf";
      sha256 = "2e91218f5bf7c36ed823c3e29e812ab4b0e9aaa268eed07da4ff74ef5f7164b9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b0e6a7fe53f6ec45f60cc4c2598732dea29d56fc/ofl/adventpro/AdventPro-ExtraLight.ttf?raw=true";
      name = "AdventPro-ExtraLight.ttf";
      sha256 = "0dd7983e3b2a7c1fa189cf2ed21e0d70fffa9e7e4e4a6ac3e07ca5e3f0ddd9a7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b0e6a7fe53f6ec45f60cc4c2598732dea29d56fc/ofl/adventpro/AdventPro-Light.ttf?raw=true";
      name = "AdventPro-Light.ttf";
      sha256 = "34633d34b71355cb5a62fde1ce6dd37af0ebf12577e460d4ed2df1f95f49dfcd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b0e6a7fe53f6ec45f60cc4c2598732dea29d56fc/ofl/adventpro/AdventPro-Regular.ttf?raw=true";
      name = "AdventPro-Regular.ttf";
      sha256 = "e7a73fe48a4ca51e0218c3fae9dea2e3a37e776b04a06c9e5d31292313855954";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b0e6a7fe53f6ec45f60cc4c2598732dea29d56fc/ofl/adventpro/AdventPro-Medium.ttf?raw=true";
      name = "AdventPro-Medium.ttf";
      sha256 = "9e9d7cdb5dcfa96a6b91951c1985ecaaf468d41e117edc907e44bea48751a600";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b0e6a7fe53f6ec45f60cc4c2598732dea29d56fc/ofl/adventpro/AdventPro-SemiBold.ttf?raw=true";
      name = "AdventPro-SemiBold.ttf";
      sha256 = "c4e2352ba86d846c9dbaceee56115a1aba1c2f104adf74aa54845d7400b0e5e6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b0e6a7fe53f6ec45f60cc4c2598732dea29d56fc/ofl/adventpro/AdventPro-Bold.ttf?raw=true";
      name = "AdventPro-Bold.ttf";
      sha256 = "460d26456a84a3fcedee50bf24611e246da77c674d2a47505c73817509e4d83d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AdventPro-Thin.ttf $out/share/fonts/truetype/AdventPro-Thin.ttf
     install -Dm644 AdventPro-ExtraLight.ttf $out/share/fonts/truetype/AdventPro-ExtraLight.ttf
     install -Dm644 AdventPro-Light.ttf $out/share/fonts/truetype/AdventPro-Light.ttf
     install -Dm644 AdventPro-Regular.ttf $out/share/fonts/truetype/AdventPro-Regular.ttf
     install -Dm644 AdventPro-Medium.ttf $out/share/fonts/truetype/AdventPro-Medium.ttf
     install -Dm644 AdventPro-SemiBold.ttf $out/share/fonts/truetype/AdventPro-SemiBold.ttf
     install -Dm644 AdventPro-Bold.ttf $out/share/fonts/truetype/AdventPro-Bold.ttf
  '';

  meta = with lib; {
    description = "Advent Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
