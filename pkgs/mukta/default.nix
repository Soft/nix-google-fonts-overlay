{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mukta-${version}";
  version = "2017-09-27-040242";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d451f695f894391bc997052eec5931f08dc6a3d/ofl/mukta/Mukta-ExtraLight.ttf?raw=true";
      name = "Mukta-ExtraLight.ttf";
      sha256 = "ff3260e6fd667797b0beb80430b0da318ccdac73c0f90fe828c2dd5a093265a1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d451f695f894391bc997052eec5931f08dc6a3d/ofl/mukta/Mukta-Light.ttf?raw=true";
      name = "Mukta-Light.ttf";
      sha256 = "161f2f22d33a1c75d9fb37d74ea99e8dbbe119cd5c102c83146fb032a552e8f2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d451f695f894391bc997052eec5931f08dc6a3d/ofl/mukta/Mukta-Regular.ttf?raw=true";
      name = "Mukta-Regular.ttf";
      sha256 = "2958e4af564507df2a856164df6f9978dacb03f999a4f34a0c269dc8a4de9688";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d451f695f894391bc997052eec5931f08dc6a3d/ofl/mukta/Mukta-Medium.ttf?raw=true";
      name = "Mukta-Medium.ttf";
      sha256 = "4db18bd8f19582607e8a6af0c4bf158b4b3378b426e42ad39d444d216c70074c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d451f695f894391bc997052eec5931f08dc6a3d/ofl/mukta/Mukta-SemiBold.ttf?raw=true";
      name = "Mukta-SemiBold.ttf";
      sha256 = "f437fb098f8f29acb8628617cb2682f0780ef22fa8b0443de1f66090c36e510a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d451f695f894391bc997052eec5931f08dc6a3d/ofl/mukta/Mukta-Bold.ttf?raw=true";
      name = "Mukta-Bold.ttf";
      sha256 = "7d22891cd57507b04af95a67ffaf59b7073b3595a27d1cfbbcefb418de820a12";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d451f695f894391bc997052eec5931f08dc6a3d/ofl/mukta/Mukta-ExtraBold.ttf?raw=true";
      name = "Mukta-ExtraBold.ttf";
      sha256 = "328eeebffe06fac60d60b46fe60c3995a908d2347e9c285f1eef1a0c9d73e004";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mukta-ExtraLight.ttf $out/share/fonts/truetype/Mukta-ExtraLight.ttf
     install -Dm644 Mukta-Light.ttf $out/share/fonts/truetype/Mukta-Light.ttf
     install -Dm644 Mukta-Regular.ttf $out/share/fonts/truetype/Mukta-Regular.ttf
     install -Dm644 Mukta-Medium.ttf $out/share/fonts/truetype/Mukta-Medium.ttf
     install -Dm644 Mukta-SemiBold.ttf $out/share/fonts/truetype/Mukta-SemiBold.ttf
     install -Dm644 Mukta-Bold.ttf $out/share/fonts/truetype/Mukta-Bold.ttf
     install -Dm644 Mukta-ExtraBold.ttf $out/share/fonts/truetype/Mukta-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Mukta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
