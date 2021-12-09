{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "expletus-sans-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/expletussans/ExpletusSans-Regular.ttf?raw=true";
      name = "ExpletusSans-Regular.ttf";
      sha256 = "71f5e7ac9fe5f6978fabd3ca07eaf003e0c0fdfb0e4d81f6aedcf789c3b68bfe";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/expletussans/ExpletusSans-Italic.ttf?raw=true";
      name = "ExpletusSans-Italic.ttf";
      sha256 = "dacda0da73fb1628d58caab04e5ee709cb8ad0fa695559d4c440fdda83b6eaaf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/expletussans/ExpletusSans-Medium.ttf?raw=true";
      name = "ExpletusSans-Medium.ttf";
      sha256 = "cfce23017a2a6e6012e01e91b5b89fc96b98d04f8a9c3e80431b0c653fa53388";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/expletussans/ExpletusSans-MediumItalic.ttf?raw=true";
      name = "ExpletusSans-MediumItalic.ttf";
      sha256 = "d81f737f8a96817a82a5caf9cf929e37ad0ba3c4efb7a20bfe3197890626ee96";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/expletussans/ExpletusSans-SemiBold.ttf?raw=true";
      name = "ExpletusSans-SemiBold.ttf";
      sha256 = "3a9ab46896396a3bc39e9c7fcee059cbfdc8c39fee44023a23ac7c454c08fe50";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/expletussans/ExpletusSans-SemiBoldItalic.ttf?raw=true";
      name = "ExpletusSans-SemiBoldItalic.ttf";
      sha256 = "e2dd178ad509306d58c550c6a2e9c79ea6313f72fa9e84f84416a75ea1c7a7b7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/expletussans/ExpletusSans-Bold.ttf?raw=true";
      name = "ExpletusSans-Bold.ttf";
      sha256 = "5ca8079ae38e9f0fcaac2223f74605a3de0e974acbe81b75c30bd7b9f51f4767";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/expletussans/ExpletusSans-BoldItalic.ttf?raw=true";
      name = "ExpletusSans-BoldItalic.ttf";
      sha256 = "6e86da046e6e83c6779816709e45e544a25f276cad3bafebd057f644fe1a3470";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ExpletusSans-Regular.ttf $out/share/fonts/truetype/ExpletusSans-Regular.ttf
     install -Dm644 ExpletusSans-Italic.ttf $out/share/fonts/truetype/ExpletusSans-Italic.ttf
     install -Dm644 ExpletusSans-Medium.ttf $out/share/fonts/truetype/ExpletusSans-Medium.ttf
     install -Dm644 ExpletusSans-MediumItalic.ttf $out/share/fonts/truetype/ExpletusSans-MediumItalic.ttf
     install -Dm644 ExpletusSans-SemiBold.ttf $out/share/fonts/truetype/ExpletusSans-SemiBold.ttf
     install -Dm644 ExpletusSans-SemiBoldItalic.ttf $out/share/fonts/truetype/ExpletusSans-SemiBoldItalic.ttf
     install -Dm644 ExpletusSans-Bold.ttf $out/share/fonts/truetype/ExpletusSans-Bold.ttf
     install -Dm644 ExpletusSans-BoldItalic.ttf $out/share/fonts/truetype/ExpletusSans-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Expletus Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
