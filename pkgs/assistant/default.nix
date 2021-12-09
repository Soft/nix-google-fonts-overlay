{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "assistant-${version}";
  version = "2017-05-23-171626";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bceed39b8f321816e102d93b2b7b159bc9fe67fa/ofl/assistant/Assistant-ExtraLight.ttf?raw=true";
      name = "Assistant-ExtraLight.ttf";
      sha256 = "9fe1032b23f258e7077f023d125c4032d0d5d78a234e5b9702b4730faebb5440";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bceed39b8f321816e102d93b2b7b159bc9fe67fa/ofl/assistant/Assistant-Light.ttf?raw=true";
      name = "Assistant-Light.ttf";
      sha256 = "1675bb69982c5b5865b825b5fdedf462ae8f3ab82732f24cb446ff83c811dc6c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bceed39b8f321816e102d93b2b7b159bc9fe67fa/ofl/assistant/Assistant-Regular.ttf?raw=true";
      name = "Assistant-Regular.ttf";
      sha256 = "91012ee6353cf7bdf0d667223a189913d51f3b966a0938218985d15f61dcc4fa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bceed39b8f321816e102d93b2b7b159bc9fe67fa/ofl/assistant/Assistant-SemiBold.ttf?raw=true";
      name = "Assistant-SemiBold.ttf";
      sha256 = "783252c39b1172a88d041471f6b6cccf13033fd179c79b3d81da58f57b8d318f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bceed39b8f321816e102d93b2b7b159bc9fe67fa/ofl/assistant/Assistant-Bold.ttf?raw=true";
      name = "Assistant-Bold.ttf";
      sha256 = "d8ddcae168318e29416305b5ef620992c548b330e94fe79301b0adc6f902cddc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bceed39b8f321816e102d93b2b7b159bc9fe67fa/ofl/assistant/Assistant-ExtraBold.ttf?raw=true";
      name = "Assistant-ExtraBold.ttf";
      sha256 = "3516f367d9399e50b21f4ceaf9aa3b099cb304c4f5a3300c5758c1cf9764a5b8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Assistant-ExtraLight.ttf $out/share/fonts/truetype/Assistant-ExtraLight.ttf
     install -Dm644 Assistant-Light.ttf $out/share/fonts/truetype/Assistant-Light.ttf
     install -Dm644 Assistant-Regular.ttf $out/share/fonts/truetype/Assistant-Regular.ttf
     install -Dm644 Assistant-SemiBold.ttf $out/share/fonts/truetype/Assistant-SemiBold.ttf
     install -Dm644 Assistant-Bold.ttf $out/share/fonts/truetype/Assistant-Bold.ttf
     install -Dm644 Assistant-ExtraBold.ttf $out/share/fonts/truetype/Assistant-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Assistant";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
