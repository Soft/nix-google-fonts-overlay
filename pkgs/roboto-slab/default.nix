{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-slab-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/apache/robotoslab/RobotoSlab-Thin.ttf?raw=true";
      name = "RobotoSlab-Thin.ttf";
      sha256 = "4e2f26097538925162cad2a3e6051f659b9895386559a1890a4664d8e9a9a0c1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/apache/robotoslab/RobotoSlab-Light.ttf?raw=true";
      name = "RobotoSlab-Light.ttf";
      sha256 = "153bf5b428d5cd0b27a63f9a36941cd7d6c7523a7afd59c76a12f798e4c33127";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/apache/robotoslab/RobotoSlab-Regular.ttf?raw=true";
      name = "RobotoSlab-Regular.ttf";
      sha256 = "13aa5f54c6f2fa2e388fe0e675cdbcc6a81f6270a8bf9c03a5df8af9cb022810";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/apache/robotoslab/RobotoSlab-Bold.ttf?raw=true";
      name = "RobotoSlab-Bold.ttf";
      sha256 = "ba12d2eab1fa765b6b05398fa7e047dd76293f0c051ce57a8f7b0c591c14d42b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RobotoSlab-Thin.ttf $out/share/fonts/truetype/RobotoSlab-Thin.ttf
     install -Dm644 RobotoSlab-Light.ttf $out/share/fonts/truetype/RobotoSlab-Light.ttf
     install -Dm644 RobotoSlab-Regular.ttf $out/share/fonts/truetype/RobotoSlab-Regular.ttf
     install -Dm644 RobotoSlab-Bold.ttf $out/share/fonts/truetype/RobotoSlab-Bold.ttf
  '';

  meta = with lib; {
    description = "Roboto Slab";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
