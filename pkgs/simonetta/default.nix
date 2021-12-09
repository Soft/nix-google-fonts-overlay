{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "simonetta-${version}";
  version = "2017-05-09-191326";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/de930e62ff3f16e45fe4afdfbab982e35e0879e5/ofl/simonetta/Simonetta-Regular.ttf?raw=true";
      name = "Simonetta-Regular.ttf";
      sha256 = "02c6cecc2c9988df0cbe3bb7d6d19b1a24023eba151dc10e1c2d0d3c2c372e23";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/de930e62ff3f16e45fe4afdfbab982e35e0879e5/ofl/simonetta/Simonetta-Italic.ttf?raw=true";
      name = "Simonetta-Italic.ttf";
      sha256 = "6a383cd72f903b4a5fae849449266907ea223ec1f318a5d18da6f5084dff2cdd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/de930e62ff3f16e45fe4afdfbab982e35e0879e5/ofl/simonetta/Simonetta-Black.ttf?raw=true";
      name = "Simonetta-Black.ttf";
      sha256 = "674524d9032574a4406f768c302ab942b8913b7c7bcda6139eb83bf6b185cb62";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/de930e62ff3f16e45fe4afdfbab982e35e0879e5/ofl/simonetta/Simonetta-BlackItalic.ttf?raw=true";
      name = "Simonetta-BlackItalic.ttf";
      sha256 = "7aabf074f7e400ca4c29ac2c3155c5cdff95f2dac9d6409a30c27f5c0dfdd17f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Simonetta-Regular.ttf $out/share/fonts/truetype/Simonetta-Regular.ttf
     install -Dm644 Simonetta-Italic.ttf $out/share/fonts/truetype/Simonetta-Italic.ttf
     install -Dm644 Simonetta-Black.ttf $out/share/fonts/truetype/Simonetta-Black.ttf
     install -Dm644 Simonetta-BlackItalic.ttf $out/share/fonts/truetype/Simonetta-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Simonetta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
