{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kanit-${version}";
  version = "2017-05-08-212610";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-Thin.ttf?raw=true";
      name = "Kanit-Thin.ttf";
      sha256 = "7b35b3312630691e08460af0057acd71fcb641dfba4c84a4c82484f57b70dd83";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-ThinItalic.ttf?raw=true";
      name = "Kanit-ThinItalic.ttf";
      sha256 = "9abffdfb05f660ed977b9fcad961a2ced8113e1aa975c5ea72ec9e7a4210ab26";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-ExtraLight.ttf?raw=true";
      name = "Kanit-ExtraLight.ttf";
      sha256 = "35284c4f9f8c23405bc2fa66f918174990c0872913045440648849726b37035a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-ExtraLightItalic.ttf?raw=true";
      name = "Kanit-ExtraLightItalic.ttf";
      sha256 = "8ddfb2648b59448a70aa947f3164533b59d5fa32e6aac6c159ef5f6d2da6fcf3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-Light.ttf?raw=true";
      name = "Kanit-Light.ttf";
      sha256 = "75b3606540e25ccf1e4b2ddd2c047716cc945ac0fe415dfce05515198a8b3967";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-LightItalic.ttf?raw=true";
      name = "Kanit-LightItalic.ttf";
      sha256 = "6f9521fe724271d694e603b697724fdbf75f905621b4098b6e866a78a59d8de3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-Regular.ttf?raw=true";
      name = "Kanit-Regular.ttf";
      sha256 = "47b3e4a00f80bb196284e13cc1e3595d3bb2260847e7f5d0b7dbb4daf13bcc59";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-Italic.ttf?raw=true";
      name = "Kanit-Italic.ttf";
      sha256 = "c1fe6216bd2383baa45e19e9944d3091062b8ea877a86275d25af3f3e61c733f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-Medium.ttf?raw=true";
      name = "Kanit-Medium.ttf";
      sha256 = "e4fe8ff037a936b77a3ef4fd7451aa3f9a47ec6d585b49faaed0e56f9633fd4b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-MediumItalic.ttf?raw=true";
      name = "Kanit-MediumItalic.ttf";
      sha256 = "18008b317a44b19cc44f2d79a889c03f9f8d0673146b65d44590bbc091062a6c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-SemiBold.ttf?raw=true";
      name = "Kanit-SemiBold.ttf";
      sha256 = "b3f66681334b4ea87141c6c2cf77088dd5b143f5455c4c2808b4c089d39fa527";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-SemiBoldItalic.ttf?raw=true";
      name = "Kanit-SemiBoldItalic.ttf";
      sha256 = "328892615ea04c87537d16be95bf6084ef3222feae447a84e4255e91b016294c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-Bold.ttf?raw=true";
      name = "Kanit-Bold.ttf";
      sha256 = "1678f94b5688736d563d7d57426e37b1a42b7bbff0599fbfea354e7440e6aa2b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-BoldItalic.ttf?raw=true";
      name = "Kanit-BoldItalic.ttf";
      sha256 = "73b45eb83a48b0d3ec69643bd5ae3a4693843f3380a8941660868c225f4b9a23";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-ExtraBold.ttf?raw=true";
      name = "Kanit-ExtraBold.ttf";
      sha256 = "61058f98e463ab74eebf78402d19b16ea4313f3d726337a1e910e037a5d9e14b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-ExtraBoldItalic.ttf?raw=true";
      name = "Kanit-ExtraBoldItalic.ttf";
      sha256 = "9631fe707d9b2460e1f4946cd819c192c7996d02e950ac922b9f90da403a9b0e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-Black.ttf?raw=true";
      name = "Kanit-Black.ttf";
      sha256 = "c0982c40e812e2a4f1dff816b892cecdf28132c3e3192d9529c4584358f53264";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b1bfc8e8e2cdfb644a33e0cf19409cbfffb1b73/ofl/kanit/Kanit-BlackItalic.ttf?raw=true";
      name = "Kanit-BlackItalic.ttf";
      sha256 = "4097f97bdc7a4e361453a841862d1cad74540841e96e092b10feaec1a41c084b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kanit-Thin.ttf $out/share/fonts/truetype/Kanit-Thin.ttf
     install -Dm644 Kanit-ThinItalic.ttf $out/share/fonts/truetype/Kanit-ThinItalic.ttf
     install -Dm644 Kanit-ExtraLight.ttf $out/share/fonts/truetype/Kanit-ExtraLight.ttf
     install -Dm644 Kanit-ExtraLightItalic.ttf $out/share/fonts/truetype/Kanit-ExtraLightItalic.ttf
     install -Dm644 Kanit-Light.ttf $out/share/fonts/truetype/Kanit-Light.ttf
     install -Dm644 Kanit-LightItalic.ttf $out/share/fonts/truetype/Kanit-LightItalic.ttf
     install -Dm644 Kanit-Regular.ttf $out/share/fonts/truetype/Kanit-Regular.ttf
     install -Dm644 Kanit-Italic.ttf $out/share/fonts/truetype/Kanit-Italic.ttf
     install -Dm644 Kanit-Medium.ttf $out/share/fonts/truetype/Kanit-Medium.ttf
     install -Dm644 Kanit-MediumItalic.ttf $out/share/fonts/truetype/Kanit-MediumItalic.ttf
     install -Dm644 Kanit-SemiBold.ttf $out/share/fonts/truetype/Kanit-SemiBold.ttf
     install -Dm644 Kanit-SemiBoldItalic.ttf $out/share/fonts/truetype/Kanit-SemiBoldItalic.ttf
     install -Dm644 Kanit-Bold.ttf $out/share/fonts/truetype/Kanit-Bold.ttf
     install -Dm644 Kanit-BoldItalic.ttf $out/share/fonts/truetype/Kanit-BoldItalic.ttf
     install -Dm644 Kanit-ExtraBold.ttf $out/share/fonts/truetype/Kanit-ExtraBold.ttf
     install -Dm644 Kanit-ExtraBoldItalic.ttf $out/share/fonts/truetype/Kanit-ExtraBoldItalic.ttf
     install -Dm644 Kanit-Black.ttf $out/share/fonts/truetype/Kanit-Black.ttf
     install -Dm644 Kanit-BlackItalic.ttf $out/share/fonts/truetype/Kanit-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Kanit";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
