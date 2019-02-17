{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cambay-${version}";
  version = "2017-05-08-150534";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/242286abf61a2f22e88ddfc25ebfeaf96a2ca334/ofl/cambay/Cambay-Regular.ttf?raw=true";
      name = "Cambay-Regular.ttf";
      sha256 = "473faf71630aa1b411fa9887951d1b7b2674efa137e6697cd71afc2bf17d4d55";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/242286abf61a2f22e88ddfc25ebfeaf96a2ca334/ofl/cambay/Cambay-Italic.ttf?raw=true";
      name = "Cambay-Italic.ttf";
      sha256 = "e2946874481bf5e3f28c6ec65a92bc529ad9ca27876fe7bcca8b0f04b5410bb3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/242286abf61a2f22e88ddfc25ebfeaf96a2ca334/ofl/cambay/Cambay-Bold.ttf?raw=true";
      name = "Cambay-Bold.ttf";
      sha256 = "75b8835327db778da23a029ad0782bde9f82567f902f9cf0cd1e18efa0fa96bc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/242286abf61a2f22e88ddfc25ebfeaf96a2ca334/ofl/cambay/Cambay-BoldItalic.ttf?raw=true";
      name = "Cambay-BoldItalic.ttf";
      sha256 = "4a5310a8d87f7909fa465794fab60dc37aab5ede8214ff7eea95f36c7a2b8974";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cambay-Regular.ttf $out/share/fonts/truetype/Cambay-Regular.ttf
     install -Dm644 Cambay-Italic.ttf $out/share/fonts/truetype/Cambay-Italic.ttf
     install -Dm644 Cambay-Bold.ttf $out/share/fonts/truetype/Cambay-Bold.ttf
     install -Dm644 Cambay-BoldItalic.ttf $out/share/fonts/truetype/Cambay-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Cambay";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
