{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hind-colombo-${version}";
  version = "2016-01-15-173120";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2000ebb7db6f7572dbe8326d53af33f167c1b47/ofl/hindcolombo/HindColombo-Light.ttf?raw=true";
      name = "HindColombo-Light.ttf";
      sha256 = "e3e47d4d3366f60fd3765d6e2716f063e30c54e32c57234e6ee4087993517186";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2000ebb7db6f7572dbe8326d53af33f167c1b47/ofl/hindcolombo/HindColombo-Regular.ttf?raw=true";
      name = "HindColombo-Regular.ttf";
      sha256 = "b7faf28ff25b882e2024fdf7d933ecaaa2a6e7fb26cef09b45a5a9fabe820514";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2000ebb7db6f7572dbe8326d53af33f167c1b47/ofl/hindcolombo/HindColombo-Medium.ttf?raw=true";
      name = "HindColombo-Medium.ttf";
      sha256 = "97e18df23617b28a000c9836a85792b677ea735ef105c1cf5c09ffc7dba1a2fb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2000ebb7db6f7572dbe8326d53af33f167c1b47/ofl/hindcolombo/HindColombo-SemiBold.ttf?raw=true";
      name = "HindColombo-SemiBold.ttf";
      sha256 = "98d35b2a27a16e3315cd0ba867aa27e9512831c911e63a068ab23de3e62a69d3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2000ebb7db6f7572dbe8326d53af33f167c1b47/ofl/hindcolombo/HindColombo-Bold.ttf?raw=true";
      name = "HindColombo-Bold.ttf";
      sha256 = "c32801dc19d5f50fd49a6d8794fdd8e89300cf4618692ea27feec10f1952b2b6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HindColombo-Light.ttf $out/share/fonts/truetype/HindColombo-Light.ttf
     install -Dm644 HindColombo-Regular.ttf $out/share/fonts/truetype/HindColombo-Regular.ttf
     install -Dm644 HindColombo-Medium.ttf $out/share/fonts/truetype/HindColombo-Medium.ttf
     install -Dm644 HindColombo-SemiBold.ttf $out/share/fonts/truetype/HindColombo-SemiBold.ttf
     install -Dm644 HindColombo-Bold.ttf $out/share/fonts/truetype/HindColombo-Bold.ttf
  '';

  meta = with lib; {
    description = "Hind Colombo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
