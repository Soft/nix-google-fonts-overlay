{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bai-jamjuree-${version}";
  version = "2018-09-07-134429";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8192d5fe3123a4ec830662dc96fe6fb221df8889/ofl/baijamjuree/BaiJamjuree-ExtraLight.ttf?raw=true";
      name = "BaiJamjuree-ExtraLight.ttf";
      sha256 = "da49f9d1efd6f190ac444af02a25606c0cd38fc78d4fc1e459d8e0171b65af11";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8192d5fe3123a4ec830662dc96fe6fb221df8889/ofl/baijamjuree/BaiJamjuree-ExtraLightItalic.ttf?raw=true";
      name = "BaiJamjuree-ExtraLightItalic.ttf";
      sha256 = "4dfac6888704172ca10ee1986d6de89de820a29310b489282b879b69f0304128";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8192d5fe3123a4ec830662dc96fe6fb221df8889/ofl/baijamjuree/BaiJamjuree-Light.ttf?raw=true";
      name = "BaiJamjuree-Light.ttf";
      sha256 = "8db41d9372b7425e7c717ba7bd3883965bada642412bccc0545102f9024d6acb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8192d5fe3123a4ec830662dc96fe6fb221df8889/ofl/baijamjuree/BaiJamjuree-LightItalic.ttf?raw=true";
      name = "BaiJamjuree-LightItalic.ttf";
      sha256 = "78e092d9c144538e575da8242888de255e02897eab0a86d75e4bc1e6b33d82fb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8192d5fe3123a4ec830662dc96fe6fb221df8889/ofl/baijamjuree/BaiJamjuree-Regular.ttf?raw=true";
      name = "BaiJamjuree-Regular.ttf";
      sha256 = "72b5a30cb78966823eb326c09b9004b0d03b4bddcdfcfd1b8cdbffb6c414547d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8192d5fe3123a4ec830662dc96fe6fb221df8889/ofl/baijamjuree/BaiJamjuree-Italic.ttf?raw=true";
      name = "BaiJamjuree-Italic.ttf";
      sha256 = "96e5f86f49442f60fd72cfc7728fde740870cccd3b8bc8a30e75dd8d9fc4b3b4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8192d5fe3123a4ec830662dc96fe6fb221df8889/ofl/baijamjuree/BaiJamjuree-Medium.ttf?raw=true";
      name = "BaiJamjuree-Medium.ttf";
      sha256 = "95782f3c3e07866749fb28e1d1a356e383e8f2bdcc7b88d4e3a3fc546613137f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8192d5fe3123a4ec830662dc96fe6fb221df8889/ofl/baijamjuree/BaiJamjuree-MediumItalic.ttf?raw=true";
      name = "BaiJamjuree-MediumItalic.ttf";
      sha256 = "f37dc3ccb6597e851e7c23fed94e6ab0df9668fb5c5d166360e81c00dd84b0bc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8192d5fe3123a4ec830662dc96fe6fb221df8889/ofl/baijamjuree/BaiJamjuree-SemiBold.ttf?raw=true";
      name = "BaiJamjuree-SemiBold.ttf";
      sha256 = "daaa68bc721e893861f948f40542b9f1ea8496a3fe4250a0ffc86dab0aee8f3c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8192d5fe3123a4ec830662dc96fe6fb221df8889/ofl/baijamjuree/BaiJamjuree-SemiBoldItalic.ttf?raw=true";
      name = "BaiJamjuree-SemiBoldItalic.ttf";
      sha256 = "cdc9cd3c2f168d1791871b72b5d62bfed7a5b87efec1bb0ba356f7fad6d623fd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8192d5fe3123a4ec830662dc96fe6fb221df8889/ofl/baijamjuree/BaiJamjuree-Bold.ttf?raw=true";
      name = "BaiJamjuree-Bold.ttf";
      sha256 = "74784411504a295a5255e736e0a8389892af2c8a14e914d3e194329b59279223";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8192d5fe3123a4ec830662dc96fe6fb221df8889/ofl/baijamjuree/BaiJamjuree-BoldItalic.ttf?raw=true";
      name = "BaiJamjuree-BoldItalic.ttf";
      sha256 = "afeefa87666738ec8689bb018dfc971a532c8fd9e8cba649d1be0176759d93c1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BaiJamjuree-ExtraLight.ttf $out/share/fonts/truetype/BaiJamjuree-ExtraLight.ttf
     install -Dm644 BaiJamjuree-ExtraLightItalic.ttf $out/share/fonts/truetype/BaiJamjuree-ExtraLightItalic.ttf
     install -Dm644 BaiJamjuree-Light.ttf $out/share/fonts/truetype/BaiJamjuree-Light.ttf
     install -Dm644 BaiJamjuree-LightItalic.ttf $out/share/fonts/truetype/BaiJamjuree-LightItalic.ttf
     install -Dm644 BaiJamjuree-Regular.ttf $out/share/fonts/truetype/BaiJamjuree-Regular.ttf
     install -Dm644 BaiJamjuree-Italic.ttf $out/share/fonts/truetype/BaiJamjuree-Italic.ttf
     install -Dm644 BaiJamjuree-Medium.ttf $out/share/fonts/truetype/BaiJamjuree-Medium.ttf
     install -Dm644 BaiJamjuree-MediumItalic.ttf $out/share/fonts/truetype/BaiJamjuree-MediumItalic.ttf
     install -Dm644 BaiJamjuree-SemiBold.ttf $out/share/fonts/truetype/BaiJamjuree-SemiBold.ttf
     install -Dm644 BaiJamjuree-SemiBoldItalic.ttf $out/share/fonts/truetype/BaiJamjuree-SemiBoldItalic.ttf
     install -Dm644 BaiJamjuree-Bold.ttf $out/share/fonts/truetype/BaiJamjuree-Bold.ttf
     install -Dm644 BaiJamjuree-BoldItalic.ttf $out/share/fonts/truetype/BaiJamjuree-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Bai Jamjuree";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
