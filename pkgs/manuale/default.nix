{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "manuale-${version}";
  version = "2016-12-03-221127";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3a506845fdeaed49873065e046b7730d2bb928dc/ofl/manuale/Manuale-Regular.ttf?raw=true";
      name = "Manuale-Regular.ttf";
      sha256 = "55fc48def9fcadae3d08ffc4a13dcdcbe3f77a67fba4304d3b81e069fadd48a1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3a506845fdeaed49873065e046b7730d2bb928dc/ofl/manuale/Manuale-Italic.ttf?raw=true";
      name = "Manuale-Italic.ttf";
      sha256 = "d24b5058aa8b7c14160710102be9c18db0bb8af92e1e3fce5fa304e865b4c68a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3a506845fdeaed49873065e046b7730d2bb928dc/ofl/manuale/Manuale-Medium.ttf?raw=true";
      name = "Manuale-Medium.ttf";
      sha256 = "5ab394d3c8217c9dc33eadab9a37a9f86459ed9bf166b5df92b1c1168c4bc560";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3a506845fdeaed49873065e046b7730d2bb928dc/ofl/manuale/Manuale-MediumItalic.ttf?raw=true";
      name = "Manuale-MediumItalic.ttf";
      sha256 = "0197654fec6d391af649ff2a97452dc8fc59bc2a388f27636676221b6bacd867";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3a506845fdeaed49873065e046b7730d2bb928dc/ofl/manuale/Manuale-SemiBold.ttf?raw=true";
      name = "Manuale-SemiBold.ttf";
      sha256 = "495f50164e1800bcdff450a9c85c319fe240ff36ff9eb7620cf8320e6d670832";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3a506845fdeaed49873065e046b7730d2bb928dc/ofl/manuale/Manuale-SemiBoldItalic.ttf?raw=true";
      name = "Manuale-SemiBoldItalic.ttf";
      sha256 = "7a75fc4c05b0304d5c8e6395d3d39db81e639a8fdd0fbb1e8f5c317917b657f3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3a506845fdeaed49873065e046b7730d2bb928dc/ofl/manuale/Manuale-Bold.ttf?raw=true";
      name = "Manuale-Bold.ttf";
      sha256 = "25aa5ea81c4bc82894d18c6d7dcf5cbb79a4a3a15c871949946a7f3cdf95906a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3a506845fdeaed49873065e046b7730d2bb928dc/ofl/manuale/Manuale-BoldItalic.ttf?raw=true";
      name = "Manuale-BoldItalic.ttf";
      sha256 = "3f8ee5066087c4e3b9927305fcedf0b27b19411e10fd368a92e29490add0b1dd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Manuale-Regular.ttf $out/share/fonts/truetype/Manuale-Regular.ttf
     install -Dm644 Manuale-Italic.ttf $out/share/fonts/truetype/Manuale-Italic.ttf
     install -Dm644 Manuale-Medium.ttf $out/share/fonts/truetype/Manuale-Medium.ttf
     install -Dm644 Manuale-MediumItalic.ttf $out/share/fonts/truetype/Manuale-MediumItalic.ttf
     install -Dm644 Manuale-SemiBold.ttf $out/share/fonts/truetype/Manuale-SemiBold.ttf
     install -Dm644 Manuale-SemiBoldItalic.ttf $out/share/fonts/truetype/Manuale-SemiBoldItalic.ttf
     install -Dm644 Manuale-Bold.ttf $out/share/fonts/truetype/Manuale-Bold.ttf
     install -Dm644 Manuale-BoldItalic.ttf $out/share/fonts/truetype/Manuale-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Manuale";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
