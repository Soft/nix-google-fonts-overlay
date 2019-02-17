{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rokkitt-${version}";
  version = "2017-02-17-184245";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/53ad59281d6e492d0ce113a487b7cc4c55088706/ofl/rokkitt/Rokkitt-Thin.ttf?raw=true";
      name = "Rokkitt-Thin.ttf";
      sha256 = "a8ee6541aa889560e624ee7961e025024050c3043f6150b43ef7591c1017207f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/53ad59281d6e492d0ce113a487b7cc4c55088706/ofl/rokkitt/Rokkitt-ExtraLight.ttf?raw=true";
      name = "Rokkitt-ExtraLight.ttf";
      sha256 = "d94e492bc1ded54bdc2c4091480e705abcbeb9b40b1478833d72d5eecf924061";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/53ad59281d6e492d0ce113a487b7cc4c55088706/ofl/rokkitt/Rokkitt-Light.ttf?raw=true";
      name = "Rokkitt-Light.ttf";
      sha256 = "01fa208a14a8a02d697087466243f92a24ccc96fd05a5e004f87c975b94541a9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/53ad59281d6e492d0ce113a487b7cc4c55088706/ofl/rokkitt/Rokkitt-Regular.ttf?raw=true";
      name = "Rokkitt-Regular.ttf";
      sha256 = "a2e17395511ddd7de4b2781f7398b6dd9c59f4226e6efc6714b6baa2973ff66e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/53ad59281d6e492d0ce113a487b7cc4c55088706/ofl/rokkitt/Rokkitt-Medium.ttf?raw=true";
      name = "Rokkitt-Medium.ttf";
      sha256 = "e63a7b27432e9f0e49719a9be527195883471173786f06b6a6fa901143b403ea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/53ad59281d6e492d0ce113a487b7cc4c55088706/ofl/rokkitt/Rokkitt-SemiBold.ttf?raw=true";
      name = "Rokkitt-SemiBold.ttf";
      sha256 = "4185a50b1a4a07ac096ba0fdad89da6ba2ef8e5eac6eeface2ddd514ceb48a62";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/53ad59281d6e492d0ce113a487b7cc4c55088706/ofl/rokkitt/Rokkitt-Bold.ttf?raw=true";
      name = "Rokkitt-Bold.ttf";
      sha256 = "1191497ef3ffed568980e8cc7b75a947296b00a702be7e13a24faee16af58609";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/53ad59281d6e492d0ce113a487b7cc4c55088706/ofl/rokkitt/Rokkitt-ExtraBold.ttf?raw=true";
      name = "Rokkitt-ExtraBold.ttf";
      sha256 = "d7346928976684f60f6d3d344ba6a948ebcecb776b1ae0959271a84b5ec096d0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/53ad59281d6e492d0ce113a487b7cc4c55088706/ofl/rokkitt/Rokkitt-Black.ttf?raw=true";
      name = "Rokkitt-Black.ttf";
      sha256 = "b68fbac24154c0506d7e2405d5f197607f0384c2d1df8cde574045de0a745339";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rokkitt-Thin.ttf $out/share/fonts/truetype/Rokkitt-Thin.ttf
     install -Dm644 Rokkitt-ExtraLight.ttf $out/share/fonts/truetype/Rokkitt-ExtraLight.ttf
     install -Dm644 Rokkitt-Light.ttf $out/share/fonts/truetype/Rokkitt-Light.ttf
     install -Dm644 Rokkitt-Regular.ttf $out/share/fonts/truetype/Rokkitt-Regular.ttf
     install -Dm644 Rokkitt-Medium.ttf $out/share/fonts/truetype/Rokkitt-Medium.ttf
     install -Dm644 Rokkitt-SemiBold.ttf $out/share/fonts/truetype/Rokkitt-SemiBold.ttf
     install -Dm644 Rokkitt-Bold.ttf $out/share/fonts/truetype/Rokkitt-Bold.ttf
     install -Dm644 Rokkitt-ExtraBold.ttf $out/share/fonts/truetype/Rokkitt-ExtraBold.ttf
     install -Dm644 Rokkitt-Black.ttf $out/share/fonts/truetype/Rokkitt-Black.ttf
  '';

  meta = with stdenv.lib; {
    description = "Rokkitt";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
