{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "faustina-${version}";
  version = "2016-12-03-222910";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/05fe8d84c25dc7802a1c1de04b8b7da0a0ce09f8/ofl/faustina/Faustina-Regular.ttf?raw=true";
      name = "Faustina-Regular.ttf";
      sha256 = "0344831e90c037ab5a7c2e1fff160b2ff17db463f3d900d07de45c601907553d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/05fe8d84c25dc7802a1c1de04b8b7da0a0ce09f8/ofl/faustina/Faustina-Italic.ttf?raw=true";
      name = "Faustina-Italic.ttf";
      sha256 = "f85f4484a7e5ea4d85e3aa9a78f0ceb7bdf5812427a63ef7458cec10c20947f1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/05fe8d84c25dc7802a1c1de04b8b7da0a0ce09f8/ofl/faustina/Faustina-Medium.ttf?raw=true";
      name = "Faustina-Medium.ttf";
      sha256 = "9bf0f2720cd87ba667fc7dcc8079490e36eab179267b1857418b0e744c11a570";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/05fe8d84c25dc7802a1c1de04b8b7da0a0ce09f8/ofl/faustina/Faustina-MediumItalic.ttf?raw=true";
      name = "Faustina-MediumItalic.ttf";
      sha256 = "d9afb8e18e433e8a68c2bf66a7455297d4a67349fabb7cac9283a34fcfa94f57";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/05fe8d84c25dc7802a1c1de04b8b7da0a0ce09f8/ofl/faustina/Faustina-SemiBold.ttf?raw=true";
      name = "Faustina-SemiBold.ttf";
      sha256 = "09205b5982b859c0cd1b58870a8ad4793c43bbd6aac6b6f8427650ca471c1b43";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/05fe8d84c25dc7802a1c1de04b8b7da0a0ce09f8/ofl/faustina/Faustina-SemiBoldItalic.ttf?raw=true";
      name = "Faustina-SemiBoldItalic.ttf";
      sha256 = "50e78cd10508c5e8d981a3f3ddd417f1ddddb747fb89115e8e1decaa1cf80108";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/05fe8d84c25dc7802a1c1de04b8b7da0a0ce09f8/ofl/faustina/Faustina-Bold.ttf?raw=true";
      name = "Faustina-Bold.ttf";
      sha256 = "a1a50ef4ea1a83782380188eddd0363d34662267a8b59a1efd6e7443591469ed";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/05fe8d84c25dc7802a1c1de04b8b7da0a0ce09f8/ofl/faustina/Faustina-BoldItalic.ttf?raw=true";
      name = "Faustina-BoldItalic.ttf";
      sha256 = "470b7f373780a4a6f8baa61b3dff95c4bde978488f95aff24e7d25676e36fed4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Faustina-Regular.ttf $out/share/fonts/truetype/Faustina-Regular.ttf
     install -Dm644 Faustina-Italic.ttf $out/share/fonts/truetype/Faustina-Italic.ttf
     install -Dm644 Faustina-Medium.ttf $out/share/fonts/truetype/Faustina-Medium.ttf
     install -Dm644 Faustina-MediumItalic.ttf $out/share/fonts/truetype/Faustina-MediumItalic.ttf
     install -Dm644 Faustina-SemiBold.ttf $out/share/fonts/truetype/Faustina-SemiBold.ttf
     install -Dm644 Faustina-SemiBoldItalic.ttf $out/share/fonts/truetype/Faustina-SemiBoldItalic.ttf
     install -Dm644 Faustina-Bold.ttf $out/share/fonts/truetype/Faustina-Bold.ttf
     install -Dm644 Faustina-BoldItalic.ttf $out/share/fonts/truetype/Faustina-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Faustina";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
