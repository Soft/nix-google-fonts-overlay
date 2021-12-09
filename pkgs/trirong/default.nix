{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "trirong-${version}";
  version = "2017-05-16-161552";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-Thin.ttf?raw=true";
      name = "Trirong-Thin.ttf";
      sha256 = "c45158916cd678d789f27bf956b04aa8f7d185bfcb0e2c644d3efd0bc1bea613";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-ThinItalic.ttf?raw=true";
      name = "Trirong-ThinItalic.ttf";
      sha256 = "64124db72dc25a153c096b0fc03810a976b2918681674fa604dc9bb5583c2c14";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-ExtraLight.ttf?raw=true";
      name = "Trirong-ExtraLight.ttf";
      sha256 = "b8795c42c38837fcb9b265ea467cc49974c113f64933f34c092e3e19a56ac947";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-ExtraLightItalic.ttf?raw=true";
      name = "Trirong-ExtraLightItalic.ttf";
      sha256 = "67c0c3d74a01d2586f680aeacc528a5e0620fb244832ee32ec767c13a00fea99";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-Light.ttf?raw=true";
      name = "Trirong-Light.ttf";
      sha256 = "4302056ccc54744ae2d9b80f34b6377c6858cb95cd534ce2531fb13a4a780793";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-LightItalic.ttf?raw=true";
      name = "Trirong-LightItalic.ttf";
      sha256 = "001e8ad176b4e565573d6bf6a354a1875ecc89b7dd442fe38119dca4952b9216";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-Regular.ttf?raw=true";
      name = "Trirong-Regular.ttf";
      sha256 = "3cd19b35a24df5fcf12c1f917324cf821d5aa582f7ea36fb0d2a91ba5e8ccd05";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-Italic.ttf?raw=true";
      name = "Trirong-Italic.ttf";
      sha256 = "c705d591725d650ad241c4bed032e553c13756849f4c68aa2a5426a006eb67a6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-Medium.ttf?raw=true";
      name = "Trirong-Medium.ttf";
      sha256 = "7d9baefbf837849e8767f8649f19dd6eb9ef83d5f63baca0268efdc566e2fe03";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-MediumItalic.ttf?raw=true";
      name = "Trirong-MediumItalic.ttf";
      sha256 = "5f7b430504320c4a7d3f9079f1f863d7bc195d60b918ba5dd41860036c377d6a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-SemiBold.ttf?raw=true";
      name = "Trirong-SemiBold.ttf";
      sha256 = "4e8cb898fb7992db7ec9d5bc2c46f265d76dd61938ecdbcdcddd937384f501b2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-SemiBoldItalic.ttf?raw=true";
      name = "Trirong-SemiBoldItalic.ttf";
      sha256 = "f6380bdd5a89d62d45cb2fee8b7c3cc922acbfc673b3d12a982253c43e20f353";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-Bold.ttf?raw=true";
      name = "Trirong-Bold.ttf";
      sha256 = "5f763f2ab302d0d81f8e0435db073bfb50a447d52dc1a060594f3dc3420ba8ae";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-BoldItalic.ttf?raw=true";
      name = "Trirong-BoldItalic.ttf";
      sha256 = "42ee8cb33788730a02e0168f159b372e5f07513829bfa5415f7998932ca37676";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-ExtraBold.ttf?raw=true";
      name = "Trirong-ExtraBold.ttf";
      sha256 = "f63665b55d81823643de251a242f296c3165de839ae377eaf7b5d1849808fa48";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-ExtraBoldItalic.ttf?raw=true";
      name = "Trirong-ExtraBoldItalic.ttf";
      sha256 = "042c70fcc2c30f7f9292390d145102b5dbe58bab2cdecbe6bb2e718a66d0e2ad";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-Black.ttf?raw=true";
      name = "Trirong-Black.ttf";
      sha256 = "56bead49f2bb6975660de599a4a4920a26cd2a3272c52004fa63145eea7e9210";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3d76b87a7f84d6cca369c8394a614c2d9316954/ofl/trirong/Trirong-BlackItalic.ttf?raw=true";
      name = "Trirong-BlackItalic.ttf";
      sha256 = "be60e1e694cd13b196e603a793e2c95e3dfb6741ec1767fcaa99d5222c93d23a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Trirong-Thin.ttf $out/share/fonts/truetype/Trirong-Thin.ttf
     install -Dm644 Trirong-ThinItalic.ttf $out/share/fonts/truetype/Trirong-ThinItalic.ttf
     install -Dm644 Trirong-ExtraLight.ttf $out/share/fonts/truetype/Trirong-ExtraLight.ttf
     install -Dm644 Trirong-ExtraLightItalic.ttf $out/share/fonts/truetype/Trirong-ExtraLightItalic.ttf
     install -Dm644 Trirong-Light.ttf $out/share/fonts/truetype/Trirong-Light.ttf
     install -Dm644 Trirong-LightItalic.ttf $out/share/fonts/truetype/Trirong-LightItalic.ttf
     install -Dm644 Trirong-Regular.ttf $out/share/fonts/truetype/Trirong-Regular.ttf
     install -Dm644 Trirong-Italic.ttf $out/share/fonts/truetype/Trirong-Italic.ttf
     install -Dm644 Trirong-Medium.ttf $out/share/fonts/truetype/Trirong-Medium.ttf
     install -Dm644 Trirong-MediumItalic.ttf $out/share/fonts/truetype/Trirong-MediumItalic.ttf
     install -Dm644 Trirong-SemiBold.ttf $out/share/fonts/truetype/Trirong-SemiBold.ttf
     install -Dm644 Trirong-SemiBoldItalic.ttf $out/share/fonts/truetype/Trirong-SemiBoldItalic.ttf
     install -Dm644 Trirong-Bold.ttf $out/share/fonts/truetype/Trirong-Bold.ttf
     install -Dm644 Trirong-BoldItalic.ttf $out/share/fonts/truetype/Trirong-BoldItalic.ttf
     install -Dm644 Trirong-ExtraBold.ttf $out/share/fonts/truetype/Trirong-ExtraBold.ttf
     install -Dm644 Trirong-ExtraBoldItalic.ttf $out/share/fonts/truetype/Trirong-ExtraBoldItalic.ttf
     install -Dm644 Trirong-Black.ttf $out/share/fonts/truetype/Trirong-Black.ttf
     install -Dm644 Trirong-BlackItalic.ttf $out/share/fonts/truetype/Trirong-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Trirong";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
