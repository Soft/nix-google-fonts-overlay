{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vollkorn-sc-${version}";
  version = "2017-10-31-213533";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5fb32282c5969930c4268483ffa5664680bf73c8/ofl/vollkornsc/VollkornSC-Regular.ttf?raw=true";
      name = "VollkornSC-Regular.ttf";
      sha256 = "a6b4dbabb5cf158f2359c15f39a0eefd5ef99434b9d443a84e6012c2fcbd81ae";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5fb32282c5969930c4268483ffa5664680bf73c8/ofl/vollkornsc/VollkornSC-SemiBold.ttf?raw=true";
      name = "VollkornSC-SemiBold.ttf";
      sha256 = "caa308c2c5970bc7732a0188eb44867fc2f2124e8acbaba7e1aa87403a70e804";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5fb32282c5969930c4268483ffa5664680bf73c8/ofl/vollkornsc/VollkornSC-Bold.ttf?raw=true";
      name = "VollkornSC-Bold.ttf";
      sha256 = "e699f58347d31321902c74ff3bafde0f2820240c89c321acff1da69e015a5f56";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5fb32282c5969930c4268483ffa5664680bf73c8/ofl/vollkornsc/VollkornSC-Black.ttf?raw=true";
      name = "VollkornSC-Black.ttf";
      sha256 = "b4db8f746ed1a2a23b73b7dbad6b723a4dae507d94e191c5a09649b6e1a8f7d6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 VollkornSC-Regular.ttf $out/share/fonts/truetype/VollkornSC-Regular.ttf
     install -Dm644 VollkornSC-SemiBold.ttf $out/share/fonts/truetype/VollkornSC-SemiBold.ttf
     install -Dm644 VollkornSC-Bold.ttf $out/share/fonts/truetype/VollkornSC-Bold.ttf
     install -Dm644 VollkornSC-Black.ttf $out/share/fonts/truetype/VollkornSC-Black.ttf
  '';

  meta = with lib; {
    description = "Vollkorn SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
