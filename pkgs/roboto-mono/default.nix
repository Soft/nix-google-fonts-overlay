{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-mono-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/017bacd6542f9d9453267715ddafc9f71fb757bf/apache/robotomono/RobotoMono-Thin.ttf?raw=true";
      name = "RobotoMono-Thin.ttf";
      sha256 = "b27a635fdffee78fab7afc08b2c5d9d11c1c189dbb543d4d5852e5eb9d22655f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/017bacd6542f9d9453267715ddafc9f71fb757bf/apache/robotomono/RobotoMono-ThinItalic.ttf?raw=true";
      name = "RobotoMono-ThinItalic.ttf";
      sha256 = "5c851cc4efc0ce509394ea637e2dd9c9429c457a80245fc6a144fc04a8f63efe";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/017bacd6542f9d9453267715ddafc9f71fb757bf/apache/robotomono/RobotoMono-Light.ttf?raw=true";
      name = "RobotoMono-Light.ttf";
      sha256 = "4e62f5daf13403a6846a0c838e487521b56294bb5a00f07d0e75063b7ed74259";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/017bacd6542f9d9453267715ddafc9f71fb757bf/apache/robotomono/RobotoMono-LightItalic.ttf?raw=true";
      name = "RobotoMono-LightItalic.ttf";
      sha256 = "2805d3d32c7da69fd92ad675fff182df61d1556337adba34a56ed7a539ca2e9c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/017bacd6542f9d9453267715ddafc9f71fb757bf/apache/robotomono/RobotoMono-Regular.ttf?raw=true";
      name = "RobotoMono-Regular.ttf";
      sha256 = "bfb5fbccb5c5d32065d9029c80877a2118b4f3be06d328d7ea4420df7c0fcf64";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/017bacd6542f9d9453267715ddafc9f71fb757bf/apache/robotomono/RobotoMono-Italic.ttf?raw=true";
      name = "RobotoMono-Italic.ttf";
      sha256 = "38151927519af9365ee3f83720bb8736f892993dc6019f0ecd7bcbfba051519d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/017bacd6542f9d9453267715ddafc9f71fb757bf/apache/robotomono/RobotoMono-Medium.ttf?raw=true";
      name = "RobotoMono-Medium.ttf";
      sha256 = "607e473da298c66f4c86abca2da5b21a5d469a8728a9e3bae2437a061a368973";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/017bacd6542f9d9453267715ddafc9f71fb757bf/apache/robotomono/RobotoMono-MediumItalic.ttf?raw=true";
      name = "RobotoMono-MediumItalic.ttf";
      sha256 = "bedc345d490d2ae4f8644ac44a500f80e54a24ec430fe8bea2c8547ed9de4cd8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/017bacd6542f9d9453267715ddafc9f71fb757bf/apache/robotomono/RobotoMono-Bold.ttf?raw=true";
      name = "RobotoMono-Bold.ttf";
      sha256 = "6250e98e33a56ab2ca07bc61835a8f53ed85d231347fc9c74136c2d356b63875";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/017bacd6542f9d9453267715ddafc9f71fb757bf/apache/robotomono/RobotoMono-BoldItalic.ttf?raw=true";
      name = "RobotoMono-BoldItalic.ttf";
      sha256 = "1810ae41851032119f44f6988d90a308c9e117e075d69cbb7ffd63a3af75f815";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RobotoMono-Thin.ttf $out/share/fonts/truetype/RobotoMono-Thin.ttf
     install -Dm644 RobotoMono-ThinItalic.ttf $out/share/fonts/truetype/RobotoMono-ThinItalic.ttf
     install -Dm644 RobotoMono-Light.ttf $out/share/fonts/truetype/RobotoMono-Light.ttf
     install -Dm644 RobotoMono-LightItalic.ttf $out/share/fonts/truetype/RobotoMono-LightItalic.ttf
     install -Dm644 RobotoMono-Regular.ttf $out/share/fonts/truetype/RobotoMono-Regular.ttf
     install -Dm644 RobotoMono-Italic.ttf $out/share/fonts/truetype/RobotoMono-Italic.ttf
     install -Dm644 RobotoMono-Medium.ttf $out/share/fonts/truetype/RobotoMono-Medium.ttf
     install -Dm644 RobotoMono-MediumItalic.ttf $out/share/fonts/truetype/RobotoMono-MediumItalic.ttf
     install -Dm644 RobotoMono-Bold.ttf $out/share/fonts/truetype/RobotoMono-Bold.ttf
     install -Dm644 RobotoMono-BoldItalic.ttf $out/share/fonts/truetype/RobotoMono-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Roboto Mono";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
