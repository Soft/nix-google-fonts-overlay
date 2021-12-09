{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zilla-slab-${version}";
  version = "2017-08-29-150909";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62f61985b394df2acc8d286c45ad3bf8491698ae/ofl/zillaslab/ZillaSlab-Light.ttf?raw=true";
      name = "ZillaSlab-Light.ttf";
      sha256 = "4c3dfcd4a5bb71ee28b6c2ec8e8bfec720f619bc00e12a13a88f0f233af7f851";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62f61985b394df2acc8d286c45ad3bf8491698ae/ofl/zillaslab/ZillaSlab-LightItalic.ttf?raw=true";
      name = "ZillaSlab-LightItalic.ttf";
      sha256 = "899c8f381f7b82a78fd5ac458405b6c212ad25bc11447f235aa097f3faf34b9e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62f61985b394df2acc8d286c45ad3bf8491698ae/ofl/zillaslab/ZillaSlab-Regular.ttf?raw=true";
      name = "ZillaSlab-Regular.ttf";
      sha256 = "41a4626844da9216b031308d4423045c765fe4231d99862d85d7d74509d37703";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62f61985b394df2acc8d286c45ad3bf8491698ae/ofl/zillaslab/ZillaSlab-Italic.ttf?raw=true";
      name = "ZillaSlab-Italic.ttf";
      sha256 = "ff0cd7a2f0db59d017d51b4ed9003f58bf21ae218ab2a965aa3bc1dd894c152b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62f61985b394df2acc8d286c45ad3bf8491698ae/ofl/zillaslab/ZillaSlab-Medium.ttf?raw=true";
      name = "ZillaSlab-Medium.ttf";
      sha256 = "d344b0f60cd5fb2d34c4168d2811ba684163e5665e20cccbcfb6ac822d84a500";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62f61985b394df2acc8d286c45ad3bf8491698ae/ofl/zillaslab/ZillaSlab-MediumItalic.ttf?raw=true";
      name = "ZillaSlab-MediumItalic.ttf";
      sha256 = "de6be2985329891035a3b3863a325a82a918a2018650c3b43fa5c4ae14815f58";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62f61985b394df2acc8d286c45ad3bf8491698ae/ofl/zillaslab/ZillaSlab-SemiBold.ttf?raw=true";
      name = "ZillaSlab-SemiBold.ttf";
      sha256 = "aafcb295b88d520357db1ecf9a1c3167055e87e9ddf5f63e560cbd139ec2805e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62f61985b394df2acc8d286c45ad3bf8491698ae/ofl/zillaslab/ZillaSlab-SemiBoldItalic.ttf?raw=true";
      name = "ZillaSlab-SemiBoldItalic.ttf";
      sha256 = "23815b73da57186d64adc71cdab4cd2bbd9be21f71efdce60d9676638f070e2f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62f61985b394df2acc8d286c45ad3bf8491698ae/ofl/zillaslab/ZillaSlab-Bold.ttf?raw=true";
      name = "ZillaSlab-Bold.ttf";
      sha256 = "4ec3a04a4eef37074b42ef542e4d874e13646668cfe65256e0bf100441cf8719";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62f61985b394df2acc8d286c45ad3bf8491698ae/ofl/zillaslab/ZillaSlab-BoldItalic.ttf?raw=true";
      name = "ZillaSlab-BoldItalic.ttf";
      sha256 = "7951036c92de71e3c88ea01abe031d5bdaddf4639022a3e1cb92322f2e88d2cf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZillaSlab-Light.ttf $out/share/fonts/truetype/ZillaSlab-Light.ttf
     install -Dm644 ZillaSlab-LightItalic.ttf $out/share/fonts/truetype/ZillaSlab-LightItalic.ttf
     install -Dm644 ZillaSlab-Regular.ttf $out/share/fonts/truetype/ZillaSlab-Regular.ttf
     install -Dm644 ZillaSlab-Italic.ttf $out/share/fonts/truetype/ZillaSlab-Italic.ttf
     install -Dm644 ZillaSlab-Medium.ttf $out/share/fonts/truetype/ZillaSlab-Medium.ttf
     install -Dm644 ZillaSlab-MediumItalic.ttf $out/share/fonts/truetype/ZillaSlab-MediumItalic.ttf
     install -Dm644 ZillaSlab-SemiBold.ttf $out/share/fonts/truetype/ZillaSlab-SemiBold.ttf
     install -Dm644 ZillaSlab-SemiBoldItalic.ttf $out/share/fonts/truetype/ZillaSlab-SemiBoldItalic.ttf
     install -Dm644 ZillaSlab-Bold.ttf $out/share/fonts/truetype/ZillaSlab-Bold.ttf
     install -Dm644 ZillaSlab-BoldItalic.ttf $out/share/fonts/truetype/ZillaSlab-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Zilla Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
