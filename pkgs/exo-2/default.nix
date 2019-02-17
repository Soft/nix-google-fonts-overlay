{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "exo-2-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-Thin.ttf?raw=true";
      name = "Exo2-Thin.ttf";
      sha256 = "6094ecb6278a42b815d2222e934f74a597e4248ebf3cb1643560a99ebe76e901";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-ThinItalic.ttf?raw=true";
      name = "Exo2-ThinItalic.ttf";
      sha256 = "d48b5f78d4b1fe0d670390fe63cff6f0b368464732f8f8711b5b738790dde348";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-ExtraLight.ttf?raw=true";
      name = "Exo2-ExtraLight.ttf";
      sha256 = "fed6759a082adf9e22c7c2172ca3cb038e27738718d3114fcf7ad7a84071aede";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-ExtraLightItalic.ttf?raw=true";
      name = "Exo2-ExtraLightItalic.ttf";
      sha256 = "379b26b41f5424e6352424ef81f18e7d2458198955f4ff8f1a8585b874a29abf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-Light.ttf?raw=true";
      name = "Exo2-Light.ttf";
      sha256 = "fd2d399ec9df6b99bbd8cf7a6c4c9c521d91751646479e8e4e67b73cc0a17349";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-LightItalic.ttf?raw=true";
      name = "Exo2-LightItalic.ttf";
      sha256 = "7d69e0271a2ded282b67f13181b298869185455aca1f2d944b69790895b6cb40";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-Regular.ttf?raw=true";
      name = "Exo2-Regular.ttf";
      sha256 = "7250d741b4fb464aaf716fea8c6cdcf18b61424ad2236cbbf5e265e333880be2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-Italic.ttf?raw=true";
      name = "Exo2-Italic.ttf";
      sha256 = "f4dacf413175ea165b2120badf1c2924b5ba7876ce097074c6809fc2cfa39fab";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-Medium.ttf?raw=true";
      name = "Exo2-Medium.ttf";
      sha256 = "f6017b1c93719808c0a9aec67f762a268dcb89bcfb0f3f6e6966a31d5b370596";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-MediumItalic.ttf?raw=true";
      name = "Exo2-MediumItalic.ttf";
      sha256 = "f884ac905418ca224edc1a905707793ab1fa1ba6384e5174e16088d8326797bd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-SemiBold.ttf?raw=true";
      name = "Exo2-SemiBold.ttf";
      sha256 = "c6566b1f2f7d8b83807346a31285f1516d78202245d7eb52b1f5fcbdde2d7a34";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-SemiBoldItalic.ttf?raw=true";
      name = "Exo2-SemiBoldItalic.ttf";
      sha256 = "fe1089a4cbda4232f31cddcc82dc51419ac4be1d7266203436082e802b04fbf0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-Bold.ttf?raw=true";
      name = "Exo2-Bold.ttf";
      sha256 = "abadb7db40a166c41a0a5e2282e4957482663035d9779d21c29ca8004956a1c5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-BoldItalic.ttf?raw=true";
      name = "Exo2-BoldItalic.ttf";
      sha256 = "c671b20cf017af9ef6688a6407d58e4f00cc7eea0f3b3edf8fb555130dbac60b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-ExtraBold.ttf?raw=true";
      name = "Exo2-ExtraBold.ttf";
      sha256 = "fd9c6169fdfbb300f1959436cf74864f329201d71221890dbe59e43559cd41f1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-ExtraBoldItalic.ttf?raw=true";
      name = "Exo2-ExtraBoldItalic.ttf";
      sha256 = "f3c300c5a3e119771dd47ebe7adb9ca8cdcbb08561922edf462aede2268b14e0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-Black.ttf?raw=true";
      name = "Exo2-Black.ttf";
      sha256 = "136e26e1a44e12dee7d4dd543afefad010cc5f884ad778289476803e0c12a49c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/exo2/Exo2-BlackItalic.ttf?raw=true";
      name = "Exo2-BlackItalic.ttf";
      sha256 = "45da712dbdaf62310e37f83f6c1d47dbb7a823824b040d0f4dbbcede52a2d532";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Exo2-Thin.ttf $out/share/fonts/truetype/Exo2-Thin.ttf
     install -Dm644 Exo2-ThinItalic.ttf $out/share/fonts/truetype/Exo2-ThinItalic.ttf
     install -Dm644 Exo2-ExtraLight.ttf $out/share/fonts/truetype/Exo2-ExtraLight.ttf
     install -Dm644 Exo2-ExtraLightItalic.ttf $out/share/fonts/truetype/Exo2-ExtraLightItalic.ttf
     install -Dm644 Exo2-Light.ttf $out/share/fonts/truetype/Exo2-Light.ttf
     install -Dm644 Exo2-LightItalic.ttf $out/share/fonts/truetype/Exo2-LightItalic.ttf
     install -Dm644 Exo2-Regular.ttf $out/share/fonts/truetype/Exo2-Regular.ttf
     install -Dm644 Exo2-Italic.ttf $out/share/fonts/truetype/Exo2-Italic.ttf
     install -Dm644 Exo2-Medium.ttf $out/share/fonts/truetype/Exo2-Medium.ttf
     install -Dm644 Exo2-MediumItalic.ttf $out/share/fonts/truetype/Exo2-MediumItalic.ttf
     install -Dm644 Exo2-SemiBold.ttf $out/share/fonts/truetype/Exo2-SemiBold.ttf
     install -Dm644 Exo2-SemiBoldItalic.ttf $out/share/fonts/truetype/Exo2-SemiBoldItalic.ttf
     install -Dm644 Exo2-Bold.ttf $out/share/fonts/truetype/Exo2-Bold.ttf
     install -Dm644 Exo2-BoldItalic.ttf $out/share/fonts/truetype/Exo2-BoldItalic.ttf
     install -Dm644 Exo2-ExtraBold.ttf $out/share/fonts/truetype/Exo2-ExtraBold.ttf
     install -Dm644 Exo2-ExtraBoldItalic.ttf $out/share/fonts/truetype/Exo2-ExtraBoldItalic.ttf
     install -Dm644 Exo2-Black.ttf $out/share/fonts/truetype/Exo2-Black.ttf
     install -Dm644 Exo2-BlackItalic.ttf $out/share/fonts/truetype/Exo2-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Exo 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
