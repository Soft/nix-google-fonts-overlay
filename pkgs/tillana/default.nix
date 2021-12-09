{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tillana-${version}";
  version = "2017-05-09-191536";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/19117e1aa8d146508c42bbf15ba4986e23cb7d73/ofl/tillana/Tillana-Regular.ttf?raw=true";
      name = "Tillana-Regular.ttf";
      sha256 = "fd907100fa0c131db999960bb7ac71243e515c330ee16e18f28fa8958bd1811b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/19117e1aa8d146508c42bbf15ba4986e23cb7d73/ofl/tillana/Tillana-Medium.ttf?raw=true";
      name = "Tillana-Medium.ttf";
      sha256 = "bff30851742c92d894a358ce788669782aabee95a9f51c39f37f2c2b853f46e8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/19117e1aa8d146508c42bbf15ba4986e23cb7d73/ofl/tillana/Tillana-SemiBold.ttf?raw=true";
      name = "Tillana-SemiBold.ttf";
      sha256 = "8bfe14bc76b8bcb2dd63b92df748e3495af0e7eeee71db4936034e6fed7119c6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/19117e1aa8d146508c42bbf15ba4986e23cb7d73/ofl/tillana/Tillana-Bold.ttf?raw=true";
      name = "Tillana-Bold.ttf";
      sha256 = "76c53b8963432418087fa3748d14be25f090fd89cd709f6c14b63679c4c72244";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/19117e1aa8d146508c42bbf15ba4986e23cb7d73/ofl/tillana/Tillana-ExtraBold.ttf?raw=true";
      name = "Tillana-ExtraBold.ttf";
      sha256 = "66e96f9cca864969fdf12311cb7157bab60d6c7d9a47d803ff06a40efd7dce25";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Tillana-Regular.ttf $out/share/fonts/truetype/Tillana-Regular.ttf
     install -Dm644 Tillana-Medium.ttf $out/share/fonts/truetype/Tillana-Medium.ttf
     install -Dm644 Tillana-SemiBold.ttf $out/share/fonts/truetype/Tillana-SemiBold.ttf
     install -Dm644 Tillana-Bold.ttf $out/share/fonts/truetype/Tillana-Bold.ttf
     install -Dm644 Tillana-ExtraBold.ttf $out/share/fonts/truetype/Tillana-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Tillana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
