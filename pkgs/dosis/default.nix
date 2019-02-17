{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dosis-${version}";
  version = "2016-05-26-000618";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/dosis/Dosis-ExtraLight.ttf?raw=true";
      name = "Dosis-ExtraLight.ttf";
      sha256 = "a301f994e33146ef69f596d779931019f7230acb7d91b66650dac642ae734945";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/dosis/Dosis-Light.ttf?raw=true";
      name = "Dosis-Light.ttf";
      sha256 = "51538a4f39e393c84a6f090aae0ddd11446d66e80c628ea1df92cd7baa161790";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/dosis/Dosis-Regular.ttf?raw=true";
      name = "Dosis-Regular.ttf";
      sha256 = "088f70e8e255e5b810a10e0d2788d3162725c7b1ab990ad9e014e401b0af82c6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/dosis/Dosis-Medium.ttf?raw=true";
      name = "Dosis-Medium.ttf";
      sha256 = "b59e299b4a25d4b8d64226e232917dc38ca29e071c7b3f8e6e29a80481171fe8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/dosis/Dosis-SemiBold.ttf?raw=true";
      name = "Dosis-SemiBold.ttf";
      sha256 = "cae27cd4383fae7ca7365208a0fca03471b6f306f1016a22a5f9752b6a0953ff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/dosis/Dosis-Bold.ttf?raw=true";
      name = "Dosis-Bold.ttf";
      sha256 = "5bce55dadaa4698b28b0ebc4db6a5ff6b5f6e8cf96582d9ab95cf66a0b749e68";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/dosis/Dosis-ExtraBold.ttf?raw=true";
      name = "Dosis-ExtraBold.ttf";
      sha256 = "1feaa13003c54993289587f5f2835f49a8a38cb91239a88e17f010d527c2ace5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dosis-ExtraLight.ttf $out/share/fonts/truetype/Dosis-ExtraLight.ttf
     install -Dm644 Dosis-Light.ttf $out/share/fonts/truetype/Dosis-Light.ttf
     install -Dm644 Dosis-Regular.ttf $out/share/fonts/truetype/Dosis-Regular.ttf
     install -Dm644 Dosis-Medium.ttf $out/share/fonts/truetype/Dosis-Medium.ttf
     install -Dm644 Dosis-SemiBold.ttf $out/share/fonts/truetype/Dosis-SemiBold.ttf
     install -Dm644 Dosis-Bold.ttf $out/share/fonts/truetype/Dosis-Bold.ttf
     install -Dm644 Dosis-ExtraBold.ttf $out/share/fonts/truetype/Dosis-ExtraBold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Dosis";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
