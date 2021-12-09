{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vesper-libre-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/039bd1f499f805403b8375fea8da220082261b8f/ofl/vesperlibre/VesperLibre-Regular.ttf?raw=true";
      name = "VesperLibre-Regular.ttf";
      sha256 = "2be8f243d90685e53bb6d6435985cf4d145d42bf70e3f964026a62c7cd96de1c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/039bd1f499f805403b8375fea8da220082261b8f/ofl/vesperlibre/VesperLibre-Medium.ttf?raw=true";
      name = "VesperLibre-Medium.ttf";
      sha256 = "46fb5e6b5600f635cbcf279cdc0129980abfc2a769712b1bde716724a200f40a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/039bd1f499f805403b8375fea8da220082261b8f/ofl/vesperlibre/VesperLibre-Bold.ttf?raw=true";
      name = "VesperLibre-Bold.ttf";
      sha256 = "11e59ae4fd3d5276573f95cea3e7e2361756817b5029b49f43c66701f81d96f8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/039bd1f499f805403b8375fea8da220082261b8f/ofl/vesperlibre/VesperLibre-Heavy.ttf?raw=true";
      name = "VesperLibre-Heavy.ttf";
      sha256 = "007fb773ea25fe9a62238860ed35797b6bb6f934cb6e1b4ae4a0abf5b8172ffd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 VesperLibre-Regular.ttf $out/share/fonts/truetype/VesperLibre-Regular.ttf
     install -Dm644 VesperLibre-Medium.ttf $out/share/fonts/truetype/VesperLibre-Medium.ttf
     install -Dm644 VesperLibre-Bold.ttf $out/share/fonts/truetype/VesperLibre-Bold.ttf
     install -Dm644 VesperLibre-Heavy.ttf $out/share/fonts/truetype/VesperLibre-Heavy.ttf
  '';

  meta = with lib; {
    description = "Vesper Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
