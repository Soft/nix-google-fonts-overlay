{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "prompt-${version}";
  version = "2017-05-23-164531";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-Thin.ttf?raw=true";
      name = "Prompt-Thin.ttf";
      sha256 = "a389f077b15b3eae6681d4824ee04bc081dbe0ebdcc160ab65a3282171608b1e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-ThinItalic.ttf?raw=true";
      name = "Prompt-ThinItalic.ttf";
      sha256 = "5c3c28a7210430ff457279b4cb57d0d444d0d0b21d5465e556e6a068a9d8630b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-ExtraLight.ttf?raw=true";
      name = "Prompt-ExtraLight.ttf";
      sha256 = "5492f48c746a6f725ad21a787bb49ec4e948dbed7a3fa1e357b0efc1eef8d881";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-ExtraLightItalic.ttf?raw=true";
      name = "Prompt-ExtraLightItalic.ttf";
      sha256 = "19236c1e38938799c326ceb78ad55712b6f13bccacdd0561292a8368803f03b1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-Light.ttf?raw=true";
      name = "Prompt-Light.ttf";
      sha256 = "79412cf5ef7f60d7f1dff4e178707b0bc662dd76608697a7a36b4769454f8b82";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-LightItalic.ttf?raw=true";
      name = "Prompt-LightItalic.ttf";
      sha256 = "58a64e6d2d3a2e37f0f488f68995f458a5e2b6c15fa0b2cd07e5b38fb613f45f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-Regular.ttf?raw=true";
      name = "Prompt-Regular.ttf";
      sha256 = "dbd497803cec3caffbc6b7f599ca6fed8beea0ed7e0ad1e098130c5ebbc4fd42";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-Italic.ttf?raw=true";
      name = "Prompt-Italic.ttf";
      sha256 = "c1188176de49e376990dff829c1bc0d686b17df96dd465f9e9368ccb2f2883cd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-Medium.ttf?raw=true";
      name = "Prompt-Medium.ttf";
      sha256 = "6a42451be692eba473c639f4bcdc6c6d9160a3d632319a64287e3ed1fae15d6b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-MediumItalic.ttf?raw=true";
      name = "Prompt-MediumItalic.ttf";
      sha256 = "e2cf416eeb5cd1f2f57ddaab7b05b9dae81178aac8f43bf8a77263f5217a104c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-SemiBold.ttf?raw=true";
      name = "Prompt-SemiBold.ttf";
      sha256 = "3285c9e6a4ebc480a6476a1a26b44d6eb0f9874025fa96e42afd52172b7f02b9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-SemiBoldItalic.ttf?raw=true";
      name = "Prompt-SemiBoldItalic.ttf";
      sha256 = "f01838c433f60813dfbdcd7f2c935169011298f0d621c318ca8e352d776c8354";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-Bold.ttf?raw=true";
      name = "Prompt-Bold.ttf";
      sha256 = "02813ca4f93c1df27e271f10fef3db6e34e66751ae1f4a3ed82ae06cb20150ea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-BoldItalic.ttf?raw=true";
      name = "Prompt-BoldItalic.ttf";
      sha256 = "d1c26068cd1291d238c04a064e169ce867315aab256bf7bd12cbe0969bb36b3a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-ExtraBold.ttf?raw=true";
      name = "Prompt-ExtraBold.ttf";
      sha256 = "f19ebea740940d6c6eb080d5ede1c78e5e68bd5b1faa34efbac251bb84740100";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-ExtraBoldItalic.ttf?raw=true";
      name = "Prompt-ExtraBoldItalic.ttf";
      sha256 = "23560ab8e908c1041befa0ac6873fbaa710de6d0ae21bc60c5b2fdedd83eeb86";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-Black.ttf?raw=true";
      name = "Prompt-Black.ttf";
      sha256 = "4fbb63f90ce9ea4214461942b521b13f6d2f7194a67de848363d829c3fdf3e66";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/603c11a48dcdcfec4a37e9b36bd2e8eee5e095f2/ofl/prompt/Prompt-BlackItalic.ttf?raw=true";
      name = "Prompt-BlackItalic.ttf";
      sha256 = "b1b27215efa6a451c2a1549c5de4c96bb389cf89e86921b3ee488ddb6702e09a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Prompt-Thin.ttf $out/share/fonts/truetype/Prompt-Thin.ttf
     install -Dm644 Prompt-ThinItalic.ttf $out/share/fonts/truetype/Prompt-ThinItalic.ttf
     install -Dm644 Prompt-ExtraLight.ttf $out/share/fonts/truetype/Prompt-ExtraLight.ttf
     install -Dm644 Prompt-ExtraLightItalic.ttf $out/share/fonts/truetype/Prompt-ExtraLightItalic.ttf
     install -Dm644 Prompt-Light.ttf $out/share/fonts/truetype/Prompt-Light.ttf
     install -Dm644 Prompt-LightItalic.ttf $out/share/fonts/truetype/Prompt-LightItalic.ttf
     install -Dm644 Prompt-Regular.ttf $out/share/fonts/truetype/Prompt-Regular.ttf
     install -Dm644 Prompt-Italic.ttf $out/share/fonts/truetype/Prompt-Italic.ttf
     install -Dm644 Prompt-Medium.ttf $out/share/fonts/truetype/Prompt-Medium.ttf
     install -Dm644 Prompt-MediumItalic.ttf $out/share/fonts/truetype/Prompt-MediumItalic.ttf
     install -Dm644 Prompt-SemiBold.ttf $out/share/fonts/truetype/Prompt-SemiBold.ttf
     install -Dm644 Prompt-SemiBoldItalic.ttf $out/share/fonts/truetype/Prompt-SemiBoldItalic.ttf
     install -Dm644 Prompt-Bold.ttf $out/share/fonts/truetype/Prompt-Bold.ttf
     install -Dm644 Prompt-BoldItalic.ttf $out/share/fonts/truetype/Prompt-BoldItalic.ttf
     install -Dm644 Prompt-ExtraBold.ttf $out/share/fonts/truetype/Prompt-ExtraBold.ttf
     install -Dm644 Prompt-ExtraBoldItalic.ttf $out/share/fonts/truetype/Prompt-ExtraBoldItalic.ttf
     install -Dm644 Prompt-Black.ttf $out/share/fonts/truetype/Prompt-Black.ttf
     install -Dm644 Prompt-BlackItalic.ttf $out/share/fonts/truetype/Prompt-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Prompt";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
