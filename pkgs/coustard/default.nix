{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "coustard-${version}";
  version = "2017-05-08-201344";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/87a9f12d368f236f3d013834aeb1d7972fc611a8/ofl/coustard/Coustard-Regular.ttf?raw=true";
      name = "Coustard-Regular.ttf";
      sha256 = "90a2e3ae98d5402102375d88819b83976a0155330bd4d19824d40471dd4c3f47";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/87a9f12d368f236f3d013834aeb1d7972fc611a8/ofl/coustard/Coustard-Black.ttf?raw=true";
      name = "Coustard-Black.ttf";
      sha256 = "d8e3e046d7177b62d91a08723122c7ca0c22ce9577261aa09e7605c47962be3d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Coustard-Regular.ttf $out/share/fonts/truetype/Coustard-Regular.ttf
     install -Dm644 Coustard-Black.ttf $out/share/fonts/truetype/Coustard-Black.ttf
  '';

  meta = with stdenv.lib; {
    description = "Coustard";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
