{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "martel-sans-${version}";
  version = "2017-05-08-222732";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e35667dbf46c1bb9f7e5c4740c9757e77fcf338b/ofl/martelsans/MartelSans-ExtraLight.ttf?raw=true";
      name = "MartelSans-ExtraLight.ttf";
      sha256 = "dc353b8e790286b8a721a371e39f2e2eb37ace13756a4580adca7e6d8543e46c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e35667dbf46c1bb9f7e5c4740c9757e77fcf338b/ofl/martelsans/MartelSans-Light.ttf?raw=true";
      name = "MartelSans-Light.ttf";
      sha256 = "e1c54736ae22799fbc2bc10d2c753b319d87dd9346ebbe86fbe0b8c59009acaa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e35667dbf46c1bb9f7e5c4740c9757e77fcf338b/ofl/martelsans/MartelSans-Regular.ttf?raw=true";
      name = "MartelSans-Regular.ttf";
      sha256 = "5c365880e5c79763c745ca132049518e69873cf3da6f7ee91711dc522b021100";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e35667dbf46c1bb9f7e5c4740c9757e77fcf338b/ofl/martelsans/MartelSans-SemiBold.ttf?raw=true";
      name = "MartelSans-SemiBold.ttf";
      sha256 = "920cb398017087b2369a036df676335a32a3af71c4560dbde0e2199a004c9fc1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e35667dbf46c1bb9f7e5c4740c9757e77fcf338b/ofl/martelsans/MartelSans-Bold.ttf?raw=true";
      name = "MartelSans-Bold.ttf";
      sha256 = "a6b8bb30ba51cf0e8afbaa47ea157bf952a1ee79ad89e772a7dff6404a2b64b4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e35667dbf46c1bb9f7e5c4740c9757e77fcf338b/ofl/martelsans/MartelSans-ExtraBold.ttf?raw=true";
      name = "MartelSans-ExtraBold.ttf";
      sha256 = "eeced1acab2ab2ebc2eeb9cf80f162583c1b36fab2e1f65bdb14c4a68bde6868";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e35667dbf46c1bb9f7e5c4740c9757e77fcf338b/ofl/martelsans/MartelSans-Black.ttf?raw=true";
      name = "MartelSans-Black.ttf";
      sha256 = "887a02992fb3560da586411d99be7ea1988d8ac6810ca881141f8fda7ac5e4aa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MartelSans-ExtraLight.ttf $out/share/fonts/truetype/MartelSans-ExtraLight.ttf
     install -Dm644 MartelSans-Light.ttf $out/share/fonts/truetype/MartelSans-Light.ttf
     install -Dm644 MartelSans-Regular.ttf $out/share/fonts/truetype/MartelSans-Regular.ttf
     install -Dm644 MartelSans-SemiBold.ttf $out/share/fonts/truetype/MartelSans-SemiBold.ttf
     install -Dm644 MartelSans-Bold.ttf $out/share/fonts/truetype/MartelSans-Bold.ttf
     install -Dm644 MartelSans-ExtraBold.ttf $out/share/fonts/truetype/MartelSans-ExtraBold.ttf
     install -Dm644 MartelSans-Black.ttf $out/share/fonts/truetype/MartelSans-Black.ttf
  '';

  meta = with lib; {
    description = "Martel Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
