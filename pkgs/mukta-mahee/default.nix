{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mukta-mahee-${version}";
  version = "2017-08-07-211311";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f8e2bd21854686233a4a5421b56c150bc5a0773/ofl/muktamahee/MuktaMahee-ExtraLight.ttf?raw=true";
      name = "MuktaMahee-ExtraLight.ttf";
      sha256 = "6780020b758bff126aa7670f7b44a6e86f399d19256a4a6831308e5764f4eeb8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f8e2bd21854686233a4a5421b56c150bc5a0773/ofl/muktamahee/MuktaMahee-Light.ttf?raw=true";
      name = "MuktaMahee-Light.ttf";
      sha256 = "c82c1dac3686050e0d9254fcb0a71a0b2a011c23bb85ebd185facd415b4cac60";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f8e2bd21854686233a4a5421b56c150bc5a0773/ofl/muktamahee/MuktaMahee-Regular.ttf?raw=true";
      name = "MuktaMahee-Regular.ttf";
      sha256 = "100eb35bf7a96697897bec747b423034a7c322e8ce314628a50a69936e2766e2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f8e2bd21854686233a4a5421b56c150bc5a0773/ofl/muktamahee/MuktaMahee-Medium.ttf?raw=true";
      name = "MuktaMahee-Medium.ttf";
      sha256 = "c1681503dc805a303b925221c9847137721b8a65e5614bbd495c2fb71eb98a97";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f8e2bd21854686233a4a5421b56c150bc5a0773/ofl/muktamahee/MuktaMahee-SemiBold.ttf?raw=true";
      name = "MuktaMahee-SemiBold.ttf";
      sha256 = "9e0bc3f02e82b95683dbd2593b0d44f6a27a7d06c3e2572501df9fa193b2bfa7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f8e2bd21854686233a4a5421b56c150bc5a0773/ofl/muktamahee/MuktaMahee-Bold.ttf?raw=true";
      name = "MuktaMahee-Bold.ttf";
      sha256 = "f3d58ebd5f28d3913bcbfc2eb1b512f8b19d7b3e82eeb63adeac4c35414c29bc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f8e2bd21854686233a4a5421b56c150bc5a0773/ofl/muktamahee/MuktaMahee-ExtraBold.ttf?raw=true";
      name = "MuktaMahee-ExtraBold.ttf";
      sha256 = "a818bc5d365109c983088dcda549f75d0633477a105520a0cc4ea411b96c816c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MuktaMahee-ExtraLight.ttf $out/share/fonts/truetype/MuktaMahee-ExtraLight.ttf
     install -Dm644 MuktaMahee-Light.ttf $out/share/fonts/truetype/MuktaMahee-Light.ttf
     install -Dm644 MuktaMahee-Regular.ttf $out/share/fonts/truetype/MuktaMahee-Regular.ttf
     install -Dm644 MuktaMahee-Medium.ttf $out/share/fonts/truetype/MuktaMahee-Medium.ttf
     install -Dm644 MuktaMahee-SemiBold.ttf $out/share/fonts/truetype/MuktaMahee-SemiBold.ttf
     install -Dm644 MuktaMahee-Bold.ttf $out/share/fonts/truetype/MuktaMahee-Bold.ttf
     install -Dm644 MuktaMahee-ExtraBold.ttf $out/share/fonts/truetype/MuktaMahee-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Mukta Mahee";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
