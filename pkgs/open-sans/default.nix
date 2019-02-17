{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "open-sans-${version}";
  version = "2017-05-16-001248";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e24bf1805f1526cd1ce3e39447d5f8e6f1f6b67/apache/opensans/OpenSans-Light.ttf?raw=true";
      name = "OpenSans-Light.ttf";
      sha256 = "1c8d3cc6810ecd3623ebff7d2c3db1a44024260c5ae662f8166d69b9425828ed";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e24bf1805f1526cd1ce3e39447d5f8e6f1f6b67/apache/opensans/OpenSans-LightItalic.ttf?raw=true";
      name = "OpenSans-LightItalic.ttf";
      sha256 = "fda70df85987b394ff384b899703bc0e55ac7bdba94d06f47462e155cf0c0350";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e24bf1805f1526cd1ce3e39447d5f8e6f1f6b67/apache/opensans/OpenSans-Regular.ttf?raw=true";
      name = "OpenSans-Regular.ttf";
      sha256 = "13c03e22a633919beb2847c58c8285fb8a735ee97097d7c48fd403f8294b05f8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e24bf1805f1526cd1ce3e39447d5f8e6f1f6b67/apache/opensans/OpenSans-Italic.ttf?raw=true";
      name = "OpenSans-Italic.ttf";
      sha256 = "6cb918a707a06c4f98221d09344af4b98c9cb6184b13309a579caf0418d5eb74";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beaec0837bd21524b57ecb435158f9011fc03999/apache/opensans/OpenSans-SemiBold.ttf?raw=true";
      name = "OpenSans-SemiBold.ttf";
      sha256 = "b4c2050b25d3d296d5cf58589ca00816dc72df42262c2f629d5c6a984a161aa4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beaec0837bd21524b57ecb435158f9011fc03999/apache/opensans/OpenSans-SemiBoldItalic.ttf?raw=true";
      name = "OpenSans-SemiBoldItalic.ttf";
      sha256 = "a8f2af8e79f46686b1cfcfb3a1fd53e94e88308d7c6ee7f85c733f4796fcc3a0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e24bf1805f1526cd1ce3e39447d5f8e6f1f6b67/apache/opensans/OpenSans-Bold.ttf?raw=true";
      name = "OpenSans-Bold.ttf";
      sha256 = "1b43de2449d39b65ff6f63315d4afda585f72fbbec2e3d9a56f59de6c75149d3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e24bf1805f1526cd1ce3e39447d5f8e6f1f6b67/apache/opensans/OpenSans-BoldItalic.ttf?raw=true";
      name = "OpenSans-BoldItalic.ttf";
      sha256 = "3575d2afaaad69970380237a5d6357b6db241f53b77607482eaf9f299b8c07ec";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e24bf1805f1526cd1ce3e39447d5f8e6f1f6b67/apache/opensans/OpenSans-ExtraBold.ttf?raw=true";
      name = "OpenSans-ExtraBold.ttf";
      sha256 = "395f150240d43dff8baea6586baf5665337de57b8204a501fbd6148b2fe165b7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e24bf1805f1526cd1ce3e39447d5f8e6f1f6b67/apache/opensans/OpenSans-ExtraBoldItalic.ttf?raw=true";
      name = "OpenSans-ExtraBoldItalic.ttf";
      sha256 = "d5de39bcdd010089d9db8dd1aebaefaf9e691bf9a49282ff43e1d1869b417892";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OpenSans-Light.ttf $out/share/fonts/truetype/OpenSans-Light.ttf
     install -Dm644 OpenSans-LightItalic.ttf $out/share/fonts/truetype/OpenSans-LightItalic.ttf
     install -Dm644 OpenSans-Regular.ttf $out/share/fonts/truetype/OpenSans-Regular.ttf
     install -Dm644 OpenSans-Italic.ttf $out/share/fonts/truetype/OpenSans-Italic.ttf
     install -Dm644 OpenSans-SemiBold.ttf $out/share/fonts/truetype/OpenSans-SemiBold.ttf
     install -Dm644 OpenSans-SemiBoldItalic.ttf $out/share/fonts/truetype/OpenSans-SemiBoldItalic.ttf
     install -Dm644 OpenSans-Bold.ttf $out/share/fonts/truetype/OpenSans-Bold.ttf
     install -Dm644 OpenSans-BoldItalic.ttf $out/share/fonts/truetype/OpenSans-BoldItalic.ttf
     install -Dm644 OpenSans-ExtraBold.ttf $out/share/fonts/truetype/OpenSans-ExtraBold.ttf
     install -Dm644 OpenSans-ExtraBoldItalic.ttf $out/share/fonts/truetype/OpenSans-ExtraBoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Open Sans";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
