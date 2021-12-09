{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gothic-a1-${version}";
  version = "2018-03-13-164329";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/gothica1/GothicA1-Thin.ttf?raw=true";
      name = "GothicA1-Thin.ttf";
      sha256 = "2caee77c0db6afe1cd759c547537361ce66945e7d6fef0f14a9a35fbb4581bb6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/gothica1/GothicA1-ExtraLight.ttf?raw=true";
      name = "GothicA1-ExtraLight.ttf";
      sha256 = "3de01e7b6bc0fdd494fa4de0677e67a73a6ae907537bb4c5f355d9c966e2ebfd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/gothica1/GothicA1-Light.ttf?raw=true";
      name = "GothicA1-Light.ttf";
      sha256 = "927826b1e23366327ebe53d4675a87938ee90b77104cb794087b5138588b53f4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/gothica1/GothicA1-Regular.ttf?raw=true";
      name = "GothicA1-Regular.ttf";
      sha256 = "211151bea98098c579610ab1114bb1bfe909057207db561f357b896d076c21ac";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/gothica1/GothicA1-Medium.ttf?raw=true";
      name = "GothicA1-Medium.ttf";
      sha256 = "c8a0eb56fa6b13448688fed0799d503fe536a8c6b7acfafdfd580edb9c4c2192";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/gothica1/GothicA1-SemiBold.ttf?raw=true";
      name = "GothicA1-SemiBold.ttf";
      sha256 = "7ee3063f2d626936d8a59dfa21525e7ed19b4e89e8fbb0ea5a924cad9b0cc1f4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/gothica1/GothicA1-Bold.ttf?raw=true";
      name = "GothicA1-Bold.ttf";
      sha256 = "2e883fa0ae548000996258b4101f2bb732a28b197264f49621a2cb16d6e9f126";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/gothica1/GothicA1-ExtraBold.ttf?raw=true";
      name = "GothicA1-ExtraBold.ttf";
      sha256 = "37a65353a646fea5a1ac90585d1bb8f9b997ecae0b79c4f1f187566f910e3f9d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/gothica1/GothicA1-Black.ttf?raw=true";
      name = "GothicA1-Black.ttf";
      sha256 = "6398ff5c6923c74cb453390892dcb982ec0a6c43b35da8590a8f32702d8c079d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GothicA1-Thin.ttf $out/share/fonts/truetype/GothicA1-Thin.ttf
     install -Dm644 GothicA1-ExtraLight.ttf $out/share/fonts/truetype/GothicA1-ExtraLight.ttf
     install -Dm644 GothicA1-Light.ttf $out/share/fonts/truetype/GothicA1-Light.ttf
     install -Dm644 GothicA1-Regular.ttf $out/share/fonts/truetype/GothicA1-Regular.ttf
     install -Dm644 GothicA1-Medium.ttf $out/share/fonts/truetype/GothicA1-Medium.ttf
     install -Dm644 GothicA1-SemiBold.ttf $out/share/fonts/truetype/GothicA1-SemiBold.ttf
     install -Dm644 GothicA1-Bold.ttf $out/share/fonts/truetype/GothicA1-Bold.ttf
     install -Dm644 GothicA1-ExtraBold.ttf $out/share/fonts/truetype/GothicA1-ExtraBold.ttf
     install -Dm644 GothicA1-Black.ttf $out/share/fonts/truetype/GothicA1-Black.ttf
  '';

  meta = with lib; {
    description = "Gothic A1";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
