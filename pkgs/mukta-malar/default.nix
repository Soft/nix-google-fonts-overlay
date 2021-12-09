{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mukta-malar-${version}";
  version = "2017-08-30-200648";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d291bf4ca3409e07b8925816092004124b442e58/ofl/muktamalar/MuktaMalar-ExtraLight.ttf?raw=true";
      name = "MuktaMalar-ExtraLight.ttf";
      sha256 = "b3509f55536f5ae6778b05f419b699ff315bed47218a4b7bbc848909a447a30e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d291bf4ca3409e07b8925816092004124b442e58/ofl/muktamalar/MuktaMalar-Light.ttf?raw=true";
      name = "MuktaMalar-Light.ttf";
      sha256 = "c29de0bc65be9ac013d9d3add8fa9a90b084ad2c241c8991c1cf9b63966fb566";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d291bf4ca3409e07b8925816092004124b442e58/ofl/muktamalar/MuktaMalar-Regular.ttf?raw=true";
      name = "MuktaMalar-Regular.ttf";
      sha256 = "51904041260855ef4ba2bf845c9bc6511ea330157b704a44c85b029195d32a73";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d291bf4ca3409e07b8925816092004124b442e58/ofl/muktamalar/MuktaMalar-Medium.ttf?raw=true";
      name = "MuktaMalar-Medium.ttf";
      sha256 = "24a63c81bf17a90a6593190bf9c7b676183f5943b4a529db1a4ef2eb0c71805f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d291bf4ca3409e07b8925816092004124b442e58/ofl/muktamalar/MuktaMalar-SemiBold.ttf?raw=true";
      name = "MuktaMalar-SemiBold.ttf";
      sha256 = "da06e2bef0ed1298499804c3c53f8be0d6c138177c4eb9ff7e8bbab5c9f53e5e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d291bf4ca3409e07b8925816092004124b442e58/ofl/muktamalar/MuktaMalar-Bold.ttf?raw=true";
      name = "MuktaMalar-Bold.ttf";
      sha256 = "d9b89b888d5e8c2e5e178118faffede3513ed74963cb2327a6381ebe6cc49c4c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d291bf4ca3409e07b8925816092004124b442e58/ofl/muktamalar/MuktaMalar-ExtraBold.ttf?raw=true";
      name = "MuktaMalar-ExtraBold.ttf";
      sha256 = "111b0e1ec07834b6e3a4589e811affcf521740589bd40bd2c279ae111a071aca";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MuktaMalar-ExtraLight.ttf $out/share/fonts/truetype/MuktaMalar-ExtraLight.ttf
     install -Dm644 MuktaMalar-Light.ttf $out/share/fonts/truetype/MuktaMalar-Light.ttf
     install -Dm644 MuktaMalar-Regular.ttf $out/share/fonts/truetype/MuktaMalar-Regular.ttf
     install -Dm644 MuktaMalar-Medium.ttf $out/share/fonts/truetype/MuktaMalar-Medium.ttf
     install -Dm644 MuktaMalar-SemiBold.ttf $out/share/fonts/truetype/MuktaMalar-SemiBold.ttf
     install -Dm644 MuktaMalar-Bold.ttf $out/share/fonts/truetype/MuktaMalar-Bold.ttf
     install -Dm644 MuktaMalar-ExtraBold.ttf $out/share/fonts/truetype/MuktaMalar-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Mukta Malar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
