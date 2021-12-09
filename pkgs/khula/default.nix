{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "khula-${version}";
  version = "2017-05-16-003426";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f4f92a27886d3757d2dcd455ac5f512a07726b19/ofl/khula/Khula-Light.ttf?raw=true";
      name = "Khula-Light.ttf";
      sha256 = "5f9d38f011cf40720df302bc51430a4f6c325abda17a9215bdc064679b12ff85";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f4f92a27886d3757d2dcd455ac5f512a07726b19/ofl/khula/Khula-Regular.ttf?raw=true";
      name = "Khula-Regular.ttf";
      sha256 = "044fcb517bcd16b50d5fb7b13aefcfb280eacd7265e78fd8f529a4c777d1b667";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f4f92a27886d3757d2dcd455ac5f512a07726b19/ofl/khula/Khula-SemiBold.ttf?raw=true";
      name = "Khula-SemiBold.ttf";
      sha256 = "121b19f633feafbc2b08a4d3e10680db0f349dcc4b45166dda41afab666511a7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f4f92a27886d3757d2dcd455ac5f512a07726b19/ofl/khula/Khula-Bold.ttf?raw=true";
      name = "Khula-Bold.ttf";
      sha256 = "0129ce592b61979c6b52e8eeed776f5fd65bf94ff92761d07b74ab048dca52da";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f4f92a27886d3757d2dcd455ac5f512a07726b19/ofl/khula/Khula-ExtraBold.ttf?raw=true";
      name = "Khula-ExtraBold.ttf";
      sha256 = "ec7a86ede2934300a44757cc620381c76c93eae8dfad8fbcf02cb2b814f439c3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Khula-Light.ttf $out/share/fonts/truetype/Khula-Light.ttf
     install -Dm644 Khula-Regular.ttf $out/share/fonts/truetype/Khula-Regular.ttf
     install -Dm644 Khula-SemiBold.ttf $out/share/fonts/truetype/Khula-SemiBold.ttf
     install -Dm644 Khula-Bold.ttf $out/share/fonts/truetype/Khula-Bold.ttf
     install -Dm644 Khula-ExtraBold.ttf $out/share/fonts/truetype/Khula-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Khula";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
