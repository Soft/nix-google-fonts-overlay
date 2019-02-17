{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "proza-libre-${version}";
  version = "2017-05-23-171549";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d49469db1f73f4adf1b8fbfa0ff1bcefd7f700a3/ofl/prozalibre/ProzaLibre-Regular.ttf?raw=true";
      name = "ProzaLibre-Regular.ttf";
      sha256 = "0a8508f0bd14dc0d5accd3f06873560fbbefc16956c135520952de1af0dfe162";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d49469db1f73f4adf1b8fbfa0ff1bcefd7f700a3/ofl/prozalibre/ProzaLibre-Italic.ttf?raw=true";
      name = "ProzaLibre-Italic.ttf";
      sha256 = "b21d2f756992d6e3e049fb79c9d889ac670e975ad1613fe1cea2ad91d856558d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d49469db1f73f4adf1b8fbfa0ff1bcefd7f700a3/ofl/prozalibre/ProzaLibre-Medium.ttf?raw=true";
      name = "ProzaLibre-Medium.ttf";
      sha256 = "3d93e4b2ba6cc5fbef8bed3d7865b42153494710debb0598244eeffb98265484";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d49469db1f73f4adf1b8fbfa0ff1bcefd7f700a3/ofl/prozalibre/ProzaLibre-MediumItalic.ttf?raw=true";
      name = "ProzaLibre-MediumItalic.ttf";
      sha256 = "511a83c00b05714b3f693a79d2097158bd75234bbaf74b488bbd910a5aa1ba72";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d49469db1f73f4adf1b8fbfa0ff1bcefd7f700a3/ofl/prozalibre/ProzaLibre-SemiBold.ttf?raw=true";
      name = "ProzaLibre-SemiBold.ttf";
      sha256 = "2e50bc0e72d8b5f6517f11b3bcd35a03f4e1c8b452b3bb6497ebc98f2d6bb4dd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d49469db1f73f4adf1b8fbfa0ff1bcefd7f700a3/ofl/prozalibre/ProzaLibre-SemiBoldItalic.ttf?raw=true";
      name = "ProzaLibre-SemiBoldItalic.ttf";
      sha256 = "452c5bf342f972cc31ed97856cd1d6de7926af7c8dc00a47bd16a4b850fa6079";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d49469db1f73f4adf1b8fbfa0ff1bcefd7f700a3/ofl/prozalibre/ProzaLibre-Bold.ttf?raw=true";
      name = "ProzaLibre-Bold.ttf";
      sha256 = "155f135da4859922f840620c299837d88acd6c6273202b1b08e0dbba3a8838d1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d49469db1f73f4adf1b8fbfa0ff1bcefd7f700a3/ofl/prozalibre/ProzaLibre-BoldItalic.ttf?raw=true";
      name = "ProzaLibre-BoldItalic.ttf";
      sha256 = "a508154c1aa22dfffc51b21a8568a8509eddb532368da9e7dfae2a85d41f8ecb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d49469db1f73f4adf1b8fbfa0ff1bcefd7f700a3/ofl/prozalibre/ProzaLibre-ExtraBold.ttf?raw=true";
      name = "ProzaLibre-ExtraBold.ttf";
      sha256 = "7b88432fceff3c94831fc62054bbc42f4ae64de0d96dd8eb9c022975f175b58c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d49469db1f73f4adf1b8fbfa0ff1bcefd7f700a3/ofl/prozalibre/ProzaLibre-ExtraBoldItalic.ttf?raw=true";
      name = "ProzaLibre-ExtraBoldItalic.ttf";
      sha256 = "0d40c91a1cb50e6eda8850225d688d178409a5e7bfaf64cffeb76738c34a68ca";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ProzaLibre-Regular.ttf $out/share/fonts/truetype/ProzaLibre-Regular.ttf
     install -Dm644 ProzaLibre-Italic.ttf $out/share/fonts/truetype/ProzaLibre-Italic.ttf
     install -Dm644 ProzaLibre-Medium.ttf $out/share/fonts/truetype/ProzaLibre-Medium.ttf
     install -Dm644 ProzaLibre-MediumItalic.ttf $out/share/fonts/truetype/ProzaLibre-MediumItalic.ttf
     install -Dm644 ProzaLibre-SemiBold.ttf $out/share/fonts/truetype/ProzaLibre-SemiBold.ttf
     install -Dm644 ProzaLibre-SemiBoldItalic.ttf $out/share/fonts/truetype/ProzaLibre-SemiBoldItalic.ttf
     install -Dm644 ProzaLibre-Bold.ttf $out/share/fonts/truetype/ProzaLibre-Bold.ttf
     install -Dm644 ProzaLibre-BoldItalic.ttf $out/share/fonts/truetype/ProzaLibre-BoldItalic.ttf
     install -Dm644 ProzaLibre-ExtraBold.ttf $out/share/fonts/truetype/ProzaLibre-ExtraBold.ttf
     install -Dm644 ProzaLibre-ExtraBoldItalic.ttf $out/share/fonts/truetype/ProzaLibre-ExtraBoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Proza Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
