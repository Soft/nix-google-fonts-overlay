{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "josefin-slab-${version}";
  version = "2017-05-08-202740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8558f60bc81e473f376ecc4f870788edd7bc83dd/ofl/josefinslab/JosefinSlab-Thin.ttf?raw=true";
      name = "JosefinSlab-Thin.ttf";
      sha256 = "d652024e2407028bac566556f984c76748d85bd82e9fd5c8f3cb23817b44068e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8558f60bc81e473f376ecc4f870788edd7bc83dd/ofl/josefinslab/JosefinSlab-ThinItalic.ttf?raw=true";
      name = "JosefinSlab-ThinItalic.ttf";
      sha256 = "f9c6b14f572a68e2241a8b6c9c8c71a0b07c124c56d07e3c34e0adb5384ba3d0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8558f60bc81e473f376ecc4f870788edd7bc83dd/ofl/josefinslab/JosefinSlab-Light.ttf?raw=true";
      name = "JosefinSlab-Light.ttf";
      sha256 = "c9d1b9d594c00e603042d750899979d4a17b170bc4337c998f457e1359f69ffb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8558f60bc81e473f376ecc4f870788edd7bc83dd/ofl/josefinslab/JosefinSlab-LightItalic.ttf?raw=true";
      name = "JosefinSlab-LightItalic.ttf";
      sha256 = "8115b593cfd8ccc6db19d501fe177f692302966906f8ef0bf4ba128fe98f32f3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8558f60bc81e473f376ecc4f870788edd7bc83dd/ofl/josefinslab/JosefinSlab-Regular.ttf?raw=true";
      name = "JosefinSlab-Regular.ttf";
      sha256 = "bc5eacea55de508b7e3411708915f9d9e1fc922d285bcc86a742c0ff9f37e6f0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8558f60bc81e473f376ecc4f870788edd7bc83dd/ofl/josefinslab/JosefinSlab-Italic.ttf?raw=true";
      name = "JosefinSlab-Italic.ttf";
      sha256 = "6a4cfcb405ad39ab12b39371ace62509a71d0f813638507cc77a06715443c647";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8558f60bc81e473f376ecc4f870788edd7bc83dd/ofl/josefinslab/JosefinSlab-SemiBold.ttf?raw=true";
      name = "JosefinSlab-SemiBold.ttf";
      sha256 = "f6321cdffd8df0a2af5638a7b1dd437fec12f98f53c6600d52b0e47cfc0166f8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8558f60bc81e473f376ecc4f870788edd7bc83dd/ofl/josefinslab/JosefinSlab-SemiBoldItalic.ttf?raw=true";
      name = "JosefinSlab-SemiBoldItalic.ttf";
      sha256 = "1ef3471e7528c73a4bf410c3541ff967d9149637b28c92f03b3be89bd8eba88d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8558f60bc81e473f376ecc4f870788edd7bc83dd/ofl/josefinslab/JosefinSlab-Bold.ttf?raw=true";
      name = "JosefinSlab-Bold.ttf";
      sha256 = "8db4c662b5ba8e11cafc67e321efa99426b1779df0c2c7c8213c7b63879ea109";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8558f60bc81e473f376ecc4f870788edd7bc83dd/ofl/josefinslab/JosefinSlab-BoldItalic.ttf?raw=true";
      name = "JosefinSlab-BoldItalic.ttf";
      sha256 = "2477b8f29a377f12ee5acbad1d5058ccf86d71c820be7e933986736b600db797";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JosefinSlab-Thin.ttf $out/share/fonts/truetype/JosefinSlab-Thin.ttf
     install -Dm644 JosefinSlab-ThinItalic.ttf $out/share/fonts/truetype/JosefinSlab-ThinItalic.ttf
     install -Dm644 JosefinSlab-Light.ttf $out/share/fonts/truetype/JosefinSlab-Light.ttf
     install -Dm644 JosefinSlab-LightItalic.ttf $out/share/fonts/truetype/JosefinSlab-LightItalic.ttf
     install -Dm644 JosefinSlab-Regular.ttf $out/share/fonts/truetype/JosefinSlab-Regular.ttf
     install -Dm644 JosefinSlab-Italic.ttf $out/share/fonts/truetype/JosefinSlab-Italic.ttf
     install -Dm644 JosefinSlab-SemiBold.ttf $out/share/fonts/truetype/JosefinSlab-SemiBold.ttf
     install -Dm644 JosefinSlab-SemiBoldItalic.ttf $out/share/fonts/truetype/JosefinSlab-SemiBoldItalic.ttf
     install -Dm644 JosefinSlab-Bold.ttf $out/share/fonts/truetype/JosefinSlab-Bold.ttf
     install -Dm644 JosefinSlab-BoldItalic.ttf $out/share/fonts/truetype/JosefinSlab-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Josefin Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
