{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yrsa-${version}";
  version = "2017-05-23-165038";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/190cfc58e199373c29f9aafdfaf279862c5a1947/ofl/yrsa/Yrsa-Light.ttf?raw=true";
      name = "Yrsa-Light.ttf";
      sha256 = "e86f2e5a747cef601933d6cdf9b5dd9a27cc0e0cbdee8a746d9490f450f2d65d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/190cfc58e199373c29f9aafdfaf279862c5a1947/ofl/yrsa/Yrsa-Regular.ttf?raw=true";
      name = "Yrsa-Regular.ttf";
      sha256 = "1c8eb26872a637b288aea123f8d683353b7eff6ee1be076b211fe049130d220a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/190cfc58e199373c29f9aafdfaf279862c5a1947/ofl/yrsa/Yrsa-Medium.ttf?raw=true";
      name = "Yrsa-Medium.ttf";
      sha256 = "5b61999f4eb06268bdd29e144420746f40a442a6f02d2255898fadd23783a4d1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/190cfc58e199373c29f9aafdfaf279862c5a1947/ofl/yrsa/Yrsa-SemiBold.ttf?raw=true";
      name = "Yrsa-SemiBold.ttf";
      sha256 = "3a02b8b0deeed0cb825f81369c11ae15a31b32f211cbb0ad6d69235ca5b4aed8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/190cfc58e199373c29f9aafdfaf279862c5a1947/ofl/yrsa/Yrsa-Bold.ttf?raw=true";
      name = "Yrsa-Bold.ttf";
      sha256 = "ee1c8d82d5a2e971574fe39f6af4776107e3eb5568dad8057ae783b017a84c76";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Yrsa-Light.ttf $out/share/fonts/truetype/Yrsa-Light.ttf
     install -Dm644 Yrsa-Regular.ttf $out/share/fonts/truetype/Yrsa-Regular.ttf
     install -Dm644 Yrsa-Medium.ttf $out/share/fonts/truetype/Yrsa-Medium.ttf
     install -Dm644 Yrsa-SemiBold.ttf $out/share/fonts/truetype/Yrsa-SemiBold.ttf
     install -Dm644 Yrsa-Bold.ttf $out/share/fonts/truetype/Yrsa-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Yrsa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
