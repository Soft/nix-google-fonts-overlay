{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "caudex-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/caudex/Caudex-Regular.ttf?raw=true";
      name = "Caudex-Regular.ttf";
      sha256 = "dbb493e1adc50aaec52071535e6fccf4176793c79545f54d95a812cbfb85169b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/caudex/Caudex-Italic.ttf?raw=true";
      name = "Caudex-Italic.ttf";
      sha256 = "ffa47f625d746e7b75c2306b7572f22561e1d73312a375772325c98213e0a4f9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/caudex/Caudex-Bold.ttf?raw=true";
      name = "Caudex-Bold.ttf";
      sha256 = "880fb67901ce94573ed0262d152b87115a08f928c72fc6c1101375a1223d390a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/caudex/Caudex-BoldItalic.ttf?raw=true";
      name = "Caudex-BoldItalic.ttf";
      sha256 = "78440e8ab6730581ac71fe780ad2fa15ba15d240313028678e404ace4e70eb20";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Caudex-Regular.ttf $out/share/fonts/truetype/Caudex-Regular.ttf
     install -Dm644 Caudex-Italic.ttf $out/share/fonts/truetype/Caudex-Italic.ttf
     install -Dm644 Caudex-Bold.ttf $out/share/fonts/truetype/Caudex-Bold.ttf
     install -Dm644 Caudex-BoldItalic.ttf $out/share/fonts/truetype/Caudex-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Caudex";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
