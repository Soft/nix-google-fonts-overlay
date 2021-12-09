{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cormorant-unicase-${version}";
  version = "2017-02-07-173703";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e439e90aeb56c594042255c453f3640e9cbfeb53/ofl/cormorantunicase/CormorantUnicase-Light.ttf?raw=true";
      name = "CormorantUnicase-Light.ttf";
      sha256 = "ae391c0f133dbe9cfa0eb9ba1d0afef3b25499fd7f84207d5f53cdbc105774df";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e439e90aeb56c594042255c453f3640e9cbfeb53/ofl/cormorantunicase/CormorantUnicase-Regular.ttf?raw=true";
      name = "CormorantUnicase-Regular.ttf";
      sha256 = "46c9457bb19a7bbe97224a8ded11989ec6a5ccdb71b30c9dc5db3b6821f5e19d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e439e90aeb56c594042255c453f3640e9cbfeb53/ofl/cormorantunicase/CormorantUnicase-Medium.ttf?raw=true";
      name = "CormorantUnicase-Medium.ttf";
      sha256 = "30c78d23bdbb6368d2f9f76bac02b8685ab58b35216b6165daf3bb78b5e20f01";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e439e90aeb56c594042255c453f3640e9cbfeb53/ofl/cormorantunicase/CormorantUnicase-SemiBold.ttf?raw=true";
      name = "CormorantUnicase-SemiBold.ttf";
      sha256 = "a1787c2f214800e80fc80703430843a8cc34a30f410cc6b13f676f6dd1f1ee6e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e439e90aeb56c594042255c453f3640e9cbfeb53/ofl/cormorantunicase/CormorantUnicase-Bold.ttf?raw=true";
      name = "CormorantUnicase-Bold.ttf";
      sha256 = "745f4976b12df9836213c72f668979e48135ede0167c61ff0b239ede1298261a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CormorantUnicase-Light.ttf $out/share/fonts/truetype/CormorantUnicase-Light.ttf
     install -Dm644 CormorantUnicase-Regular.ttf $out/share/fonts/truetype/CormorantUnicase-Regular.ttf
     install -Dm644 CormorantUnicase-Medium.ttf $out/share/fonts/truetype/CormorantUnicase-Medium.ttf
     install -Dm644 CormorantUnicase-SemiBold.ttf $out/share/fonts/truetype/CormorantUnicase-SemiBold.ttf
     install -Dm644 CormorantUnicase-Bold.ttf $out/share/fonts/truetype/CormorantUnicase-Bold.ttf
  '';

  meta = with lib; {
    description = "Cormorant Unicase";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
