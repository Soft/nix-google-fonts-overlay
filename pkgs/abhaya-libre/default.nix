{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "abhaya-libre-${version}";
  version = "2017-02-17-184301";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f8dbc76905437e947506289c8d41dfc0e123f02f/ofl/abhayalibre/AbhayaLibre-Regular.ttf?raw=true";
      name = "AbhayaLibre-Regular.ttf";
      sha256 = "d4279d38a0012fa54d340979694e70e3235266220dedc0d7000131345fb33bd4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f8dbc76905437e947506289c8d41dfc0e123f02f/ofl/abhayalibre/AbhayaLibre-Medium.ttf?raw=true";
      name = "AbhayaLibre-Medium.ttf";
      sha256 = "d3d4051877dc9538a71720d5fdba4118cdcd467096972c524a9fff9c45269f4b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f8dbc76905437e947506289c8d41dfc0e123f02f/ofl/abhayalibre/AbhayaLibre-SemiBold.ttf?raw=true";
      name = "AbhayaLibre-SemiBold.ttf";
      sha256 = "254d773d80ecd382f5e4d818418ad521aa5a8d69cc996d0ac0a1c3f0417fabc0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f8dbc76905437e947506289c8d41dfc0e123f02f/ofl/abhayalibre/AbhayaLibre-Bold.ttf?raw=true";
      name = "AbhayaLibre-Bold.ttf";
      sha256 = "01fb4cd74841c5f108372737a74cfedeaf0a722ca23e2275dc69f411dc0ad5a6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f8dbc76905437e947506289c8d41dfc0e123f02f/ofl/abhayalibre/AbhayaLibre-ExtraBold.ttf?raw=true";
      name = "AbhayaLibre-ExtraBold.ttf";
      sha256 = "a8d05da8766a9bc540e0ea5b63f36a141d629907e8f06c4c2b23bb0bd741b2e1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AbhayaLibre-Regular.ttf $out/share/fonts/truetype/AbhayaLibre-Regular.ttf
     install -Dm644 AbhayaLibre-Medium.ttf $out/share/fonts/truetype/AbhayaLibre-Medium.ttf
     install -Dm644 AbhayaLibre-SemiBold.ttf $out/share/fonts/truetype/AbhayaLibre-SemiBold.ttf
     install -Dm644 AbhayaLibre-Bold.ttf $out/share/fonts/truetype/AbhayaLibre-Bold.ttf
     install -Dm644 AbhayaLibre-ExtraBold.ttf $out/share/fonts/truetype/AbhayaLibre-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Abhaya Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
