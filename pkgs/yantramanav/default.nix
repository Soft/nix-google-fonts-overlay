{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yantramanav-${version}";
  version = "2017-05-09-190330";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/094417bc05c312d64367747c4fb1e5129521c426/ofl/yantramanav/Yantramanav-Thin.ttf?raw=true";
      name = "Yantramanav-Thin.ttf";
      sha256 = "6e88e360cd722b123e1426e4d98602790b805def1fb198ece28f3bfcaf168650";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/094417bc05c312d64367747c4fb1e5129521c426/ofl/yantramanav/Yantramanav-Light.ttf?raw=true";
      name = "Yantramanav-Light.ttf";
      sha256 = "aafcbbf2c8a104746ba7f551050e03b4fff8a2094d7ea10adfca3e30bcc15db8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/094417bc05c312d64367747c4fb1e5129521c426/ofl/yantramanav/Yantramanav-Regular.ttf?raw=true";
      name = "Yantramanav-Regular.ttf";
      sha256 = "823dbb5d9c73a2c192371bf73341a30291b5a416578362eb4607b9c5a5be9821";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/094417bc05c312d64367747c4fb1e5129521c426/ofl/yantramanav/Yantramanav-Medium.ttf?raw=true";
      name = "Yantramanav-Medium.ttf";
      sha256 = "8c6287e28f009a687d0616ad5f31e0f8fc513b82df09093ef5bae65dfc216206";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/094417bc05c312d64367747c4fb1e5129521c426/ofl/yantramanav/Yantramanav-Bold.ttf?raw=true";
      name = "Yantramanav-Bold.ttf";
      sha256 = "682ef4ebc9c8dde1f312c435ade5eca9cafea6ab0c3602e1638c02d3759b135d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/094417bc05c312d64367747c4fb1e5129521c426/ofl/yantramanav/Yantramanav-Black.ttf?raw=true";
      name = "Yantramanav-Black.ttf";
      sha256 = "8862dd6dba166ec1060c9fc0159b04c470e7102f3967d1746072bdab98a4d031";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Yantramanav-Thin.ttf $out/share/fonts/truetype/Yantramanav-Thin.ttf
     install -Dm644 Yantramanav-Light.ttf $out/share/fonts/truetype/Yantramanav-Light.ttf
     install -Dm644 Yantramanav-Regular.ttf $out/share/fonts/truetype/Yantramanav-Regular.ttf
     install -Dm644 Yantramanav-Medium.ttf $out/share/fonts/truetype/Yantramanav-Medium.ttf
     install -Dm644 Yantramanav-Bold.ttf $out/share/fonts/truetype/Yantramanav-Bold.ttf
     install -Dm644 Yantramanav-Black.ttf $out/share/fonts/truetype/Yantramanav-Black.ttf
  '';

  meta = with lib; {
    description = "Yantramanav";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
