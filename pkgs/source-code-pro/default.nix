{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "source-code-pro-${version}";
  version = "2017-05-16-005212";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/18b5208c2a778d85c1312ec3b18b1d3b822cc51a/ofl/sourcecodepro/SourceCodePro-ExtraLight.ttf?raw=true";
      name = "SourceCodePro-ExtraLight.ttf";
      sha256 = "fa88b51f6bc723cf79510e35832add59eafdc3e5110fce06e911eea608e29aa5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/18b5208c2a778d85c1312ec3b18b1d3b822cc51a/ofl/sourcecodepro/SourceCodePro-Light.ttf?raw=true";
      name = "SourceCodePro-Light.ttf";
      sha256 = "40a8c2954e9a8abd194298554a23aa062b3ea3b63575fad245603a254023cb40";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/18b5208c2a778d85c1312ec3b18b1d3b822cc51a/ofl/sourcecodepro/SourceCodePro-Regular.ttf?raw=true";
      name = "SourceCodePro-Regular.ttf";
      sha256 = "9930d84013bfd7682df9d0d740d6417c111bfd49f29123e9da0cadb082483753";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/18b5208c2a778d85c1312ec3b18b1d3b822cc51a/ofl/sourcecodepro/SourceCodePro-Medium.ttf?raw=true";
      name = "SourceCodePro-Medium.ttf";
      sha256 = "3f4f1e1f6271bac120e9b615f93f0afd9fa2cec261d17fc5aed65dba89205f1d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d774fc0799fdeddbd8720616a6d2d791be29fafa/ofl/sourcecodepro/SourceCodePro-SemiBold.ttf?raw=true";
      name = "SourceCodePro-SemiBold.ttf";
      sha256 = "79eeacecad89a8bcdd2c9ff555f7d9c491450e6b02add4b4f755d960da72970e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/18b5208c2a778d85c1312ec3b18b1d3b822cc51a/ofl/sourcecodepro/SourceCodePro-Bold.ttf?raw=true";
      name = "SourceCodePro-Bold.ttf";
      sha256 = "e08986648db964ba2e45230f715af50f95ad1840aa3650a56c72036c955b1443";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/18b5208c2a778d85c1312ec3b18b1d3b822cc51a/ofl/sourcecodepro/SourceCodePro-Black.ttf?raw=true";
      name = "SourceCodePro-Black.ttf";
      sha256 = "45407b47993c11f8b56d7eaf5305938053d075e90282af6e79627f2ce4dea4ba";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SourceCodePro-ExtraLight.ttf $out/share/fonts/truetype/SourceCodePro-ExtraLight.ttf
     install -Dm644 SourceCodePro-Light.ttf $out/share/fonts/truetype/SourceCodePro-Light.ttf
     install -Dm644 SourceCodePro-Regular.ttf $out/share/fonts/truetype/SourceCodePro-Regular.ttf
     install -Dm644 SourceCodePro-Medium.ttf $out/share/fonts/truetype/SourceCodePro-Medium.ttf
     install -Dm644 SourceCodePro-SemiBold.ttf $out/share/fonts/truetype/SourceCodePro-SemiBold.ttf
     install -Dm644 SourceCodePro-Bold.ttf $out/share/fonts/truetype/SourceCodePro-Bold.ttf
     install -Dm644 SourceCodePro-Black.ttf $out/share/fonts/truetype/SourceCodePro-Black.ttf
  '';

  meta = with stdenv.lib; {
    description = "Source Code Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
