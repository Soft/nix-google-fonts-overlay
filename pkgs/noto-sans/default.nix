{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-${version}";
  version = "2016-01-18-151312";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3043c22d2f091ead19f47fbcabdd696b8c9b7edd/ofl/notosans/NotoSans-Regular.ttf?raw=true";
      name = "NotoSans-Regular.ttf";
      sha256 = "9e9b4c53bd25cad9c04d370f133a5e32d166d0d54e2a9ad6cba4a31fcd382d5b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3043c22d2f091ead19f47fbcabdd696b8c9b7edd/ofl/notosans/NotoSans-Italic.ttf?raw=true";
      name = "NotoSans-Italic.ttf";
      sha256 = "7d614e7ee6d32cfba2631bf986bc7ec65a1d9973bb414cb9e5aeb7dad85c8787";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3043c22d2f091ead19f47fbcabdd696b8c9b7edd/ofl/notosans/NotoSans-Bold.ttf?raw=true";
      name = "NotoSans-Bold.ttf";
      sha256 = "68bdd57a1e1e62663a0b372c7224204b82a89820b9cf30391337f61f0c5e7123";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3043c22d2f091ead19f47fbcabdd696b8c9b7edd/ofl/notosans/NotoSans-BoldItalic.ttf?raw=true";
      name = "NotoSans-BoldItalic.ttf";
      sha256 = "8bedb0127e914ac3ade237b402d33e573acc4bdba0b9e3981272cae34ff9857a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSans-Regular.ttf $out/share/fonts/truetype/NotoSans-Regular.ttf
     install -Dm644 NotoSans-Italic.ttf $out/share/fonts/truetype/NotoSans-Italic.ttf
     install -Dm644 NotoSans-Bold.ttf $out/share/fonts/truetype/NotoSans-Bold.ttf
     install -Dm644 NotoSans-BoldItalic.ttf $out/share/fonts/truetype/NotoSans-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Noto Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
