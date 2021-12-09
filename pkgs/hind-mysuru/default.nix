{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hind-mysuru-${version}";
  version = "2016-01-15-173120";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2a8b187d3cf35d1556cf1ea4424b496d5cd8085/ofl/hindmysuru/HindMysuru-Light.ttf?raw=true";
      name = "HindMysuru-Light.ttf";
      sha256 = "40634c5beb3700c0f1b556c8ddf4dda27e6a20fb1b90da7a5cae85c536284887";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2a8b187d3cf35d1556cf1ea4424b496d5cd8085/ofl/hindmysuru/HindMysuru-Regular.ttf?raw=true";
      name = "HindMysuru-Regular.ttf";
      sha256 = "a38a33806d9f008fbdf204d2f684e80b23cecfc42ee0c2aed81c7b3a8333e7f2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2a8b187d3cf35d1556cf1ea4424b496d5cd8085/ofl/hindmysuru/HindMysuru-Medium.ttf?raw=true";
      name = "HindMysuru-Medium.ttf";
      sha256 = "cef72258d349131d78ca9d5de286d4d54199d27e506287ad08345b01626c3240";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2a8b187d3cf35d1556cf1ea4424b496d5cd8085/ofl/hindmysuru/HindMysuru-SemiBold.ttf?raw=true";
      name = "HindMysuru-SemiBold.ttf";
      sha256 = "7a9eed3f486affb0e469acf75e60562743a1993737f79635bed740aaa8c82a84";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2a8b187d3cf35d1556cf1ea4424b496d5cd8085/ofl/hindmysuru/HindMysuru-Bold.ttf?raw=true";
      name = "HindMysuru-Bold.ttf";
      sha256 = "37e0493369db44f74d42ef36c2dda9a1977f9a724e5ac51a2ca7edd38189aa28";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HindMysuru-Light.ttf $out/share/fonts/truetype/HindMysuru-Light.ttf
     install -Dm644 HindMysuru-Regular.ttf $out/share/fonts/truetype/HindMysuru-Regular.ttf
     install -Dm644 HindMysuru-Medium.ttf $out/share/fonts/truetype/HindMysuru-Medium.ttf
     install -Dm644 HindMysuru-SemiBold.ttf $out/share/fonts/truetype/HindMysuru-SemiBold.ttf
     install -Dm644 HindMysuru-Bold.ttf $out/share/fonts/truetype/HindMysuru-Bold.ttf
  '';

  meta = with lib; {
    description = "Hind Mysuru";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
