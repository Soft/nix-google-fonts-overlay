{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "terminal-dosis-${version}";
  version = "2016-05-26-000618";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1519faabd3f86e18c98cc7b79211a99f783a35e9/ofl/terminaldosis/TerminalDosis-ExtraLight.ttf?raw=true";
      name = "TerminalDosis-ExtraLight.ttf";
      sha256 = "a301f994e33146ef69f596d779931019f7230acb7d91b66650dac642ae734945";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1519faabd3f86e18c98cc7b79211a99f783a35e9/ofl/terminaldosis/TerminalDosis-Light.ttf?raw=true";
      name = "TerminalDosis-Light.ttf";
      sha256 = "51538a4f39e393c84a6f090aae0ddd11446d66e80c628ea1df92cd7baa161790";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1519faabd3f86e18c98cc7b79211a99f783a35e9/ofl/terminaldosis/TerminalDosis-Regular.ttf?raw=true";
      name = "TerminalDosis-Regular.ttf";
      sha256 = "088f70e8e255e5b810a10e0d2788d3162725c7b1ab990ad9e014e401b0af82c6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1519faabd3f86e18c98cc7b79211a99f783a35e9/ofl/terminaldosis/TerminalDosis-Medium.ttf?raw=true";
      name = "TerminalDosis-Medium.ttf";
      sha256 = "b59e299b4a25d4b8d64226e232917dc38ca29e071c7b3f8e6e29a80481171fe8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1519faabd3f86e18c98cc7b79211a99f783a35e9/ofl/terminaldosis/TerminalDosis-SemiBold.ttf?raw=true";
      name = "TerminalDosis-SemiBold.ttf";
      sha256 = "cae27cd4383fae7ca7365208a0fca03471b6f306f1016a22a5f9752b6a0953ff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1519faabd3f86e18c98cc7b79211a99f783a35e9/ofl/terminaldosis/TerminalDosis-Bold.ttf?raw=true";
      name = "TerminalDosis-Bold.ttf";
      sha256 = "5bce55dadaa4698b28b0ebc4db6a5ff6b5f6e8cf96582d9ab95cf66a0b749e68";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1519faabd3f86e18c98cc7b79211a99f783a35e9/ofl/terminaldosis/TerminalDosis-ExtraBold.ttf?raw=true";
      name = "TerminalDosis-ExtraBold.ttf";
      sha256 = "1feaa13003c54993289587f5f2835f49a8a38cb91239a88e17f010d527c2ace5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TerminalDosis-ExtraLight.ttf $out/share/fonts/truetype/TerminalDosis-ExtraLight.ttf
     install -Dm644 TerminalDosis-Light.ttf $out/share/fonts/truetype/TerminalDosis-Light.ttf
     install -Dm644 TerminalDosis-Regular.ttf $out/share/fonts/truetype/TerminalDosis-Regular.ttf
     install -Dm644 TerminalDosis-Medium.ttf $out/share/fonts/truetype/TerminalDosis-Medium.ttf
     install -Dm644 TerminalDosis-SemiBold.ttf $out/share/fonts/truetype/TerminalDosis-SemiBold.ttf
     install -Dm644 TerminalDosis-Bold.ttf $out/share/fonts/truetype/TerminalDosis-Bold.ttf
     install -Dm644 TerminalDosis-ExtraBold.ttf $out/share/fonts/truetype/TerminalDosis-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Terminal Dosis";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
