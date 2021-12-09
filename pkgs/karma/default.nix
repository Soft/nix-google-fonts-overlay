{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "karma-${version}";
  version = "2017-05-16-003441";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/08ec04d13304b3653ca821c3e7f2495f000a2f4c/ofl/karma/Karma-Light.ttf?raw=true";
      name = "Karma-Light.ttf";
      sha256 = "8a6174244c519f4190f7995ae64e52b4203b01156327d02ca07c5445ad2eda3d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/08ec04d13304b3653ca821c3e7f2495f000a2f4c/ofl/karma/Karma-Regular.ttf?raw=true";
      name = "Karma-Regular.ttf";
      sha256 = "cc3457d2867b67ee956d95206dbc831e57b26975219d3d4e68d60f51f67b4b55";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/08ec04d13304b3653ca821c3e7f2495f000a2f4c/ofl/karma/Karma-Medium.ttf?raw=true";
      name = "Karma-Medium.ttf";
      sha256 = "28ef21834a486aafee86cbdfad1b89d7ebd175c0d58bcf07099f7cabc3bc9406";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/08ec04d13304b3653ca821c3e7f2495f000a2f4c/ofl/karma/Karma-SemiBold.ttf?raw=true";
      name = "Karma-SemiBold.ttf";
      sha256 = "e4189f11c7794358e14d66e3661c585ce1b550403b327abc4ea4d240dcdc5116";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/08ec04d13304b3653ca821c3e7f2495f000a2f4c/ofl/karma/Karma-Bold.ttf?raw=true";
      name = "Karma-Bold.ttf";
      sha256 = "3819cedaa8ef7247aaae77113cbb9b22b207f5fe6c045ae0e1442a7b6b69328e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Karma-Light.ttf $out/share/fonts/truetype/Karma-Light.ttf
     install -Dm644 Karma-Regular.ttf $out/share/fonts/truetype/Karma-Regular.ttf
     install -Dm644 Karma-Medium.ttf $out/share/fonts/truetype/Karma-Medium.ttf
     install -Dm644 Karma-SemiBold.ttf $out/share/fonts/truetype/Karma-SemiBold.ttf
     install -Dm644 Karma-Bold.ttf $out/share/fonts/truetype/Karma-Bold.ttf
  '';

  meta = with lib; {
    description = "Karma";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
