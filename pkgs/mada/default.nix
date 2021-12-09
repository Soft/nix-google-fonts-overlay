{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mada-${version}";
  version = "2017-07-27-173017";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/82724194afe19016e7ca294c4187684b51d1de11/ofl/mada/Mada-ExtraLight.ttf?raw=true";
      name = "Mada-ExtraLight.ttf";
      sha256 = "9e8f4edc7b74697883d4382000502d7429481f7ccc59b65ac62c28e99481cbc3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/82724194afe19016e7ca294c4187684b51d1de11/ofl/mada/Mada-Light.ttf?raw=true";
      name = "Mada-Light.ttf";
      sha256 = "4987425fde45e8da45ede3fad409b0ac00e32ca0255a60b44b8e1f701764346c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/82724194afe19016e7ca294c4187684b51d1de11/ofl/mada/Mada-Regular.ttf?raw=true";
      name = "Mada-Regular.ttf";
      sha256 = "9e3c24ab83037a6d4fc5b72d068caaa6a0767414bd20d7defe31c562ced6d6e7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/82724194afe19016e7ca294c4187684b51d1de11/ofl/mada/Mada-Medium.ttf?raw=true";
      name = "Mada-Medium.ttf";
      sha256 = "c3e70bf71ab0557ddd82906726c36d89e199792db1997040b1599f61e00acd78";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/82724194afe19016e7ca294c4187684b51d1de11/ofl/mada/Mada-SemiBold.ttf?raw=true";
      name = "Mada-SemiBold.ttf";
      sha256 = "052e0e0f174e9e8ff63bf2a85f70db6cc59d3391a016a31ace8e20c49d0fa0d6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/82724194afe19016e7ca294c4187684b51d1de11/ofl/mada/Mada-Bold.ttf?raw=true";
      name = "Mada-Bold.ttf";
      sha256 = "b94e1f9c917ae40e5e6b8d95fe24de1817e37942aafb9b9310d5e0d4b049221a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/82724194afe19016e7ca294c4187684b51d1de11/ofl/mada/Mada-Black.ttf?raw=true";
      name = "Mada-Black.ttf";
      sha256 = "7746a4ca1c6767a971c0db31ec18594fa5211adcc318e293d27b55efc36bded9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mada-ExtraLight.ttf $out/share/fonts/truetype/Mada-ExtraLight.ttf
     install -Dm644 Mada-Light.ttf $out/share/fonts/truetype/Mada-Light.ttf
     install -Dm644 Mada-Regular.ttf $out/share/fonts/truetype/Mada-Regular.ttf
     install -Dm644 Mada-Medium.ttf $out/share/fonts/truetype/Mada-Medium.ttf
     install -Dm644 Mada-SemiBold.ttf $out/share/fonts/truetype/Mada-SemiBold.ttf
     install -Dm644 Mada-Bold.ttf $out/share/fonts/truetype/Mada-Bold.ttf
     install -Dm644 Mada-Black.ttf $out/share/fonts/truetype/Mada-Black.ttf
  '';

  meta = with lib; {
    description = "Mada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
