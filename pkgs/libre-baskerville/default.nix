{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-baskerville-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/librebaskerville/LibreBaskerville-Regular.ttf?raw=true";
      name = "LibreBaskerville-Regular.ttf";
      sha256 = "fd64409c4238f4c90eafc8900e41924bbc3e86a86f48aaca66f6b4d01b0aceb7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/librebaskerville/LibreBaskerville-Italic.ttf?raw=true";
      name = "LibreBaskerville-Italic.ttf";
      sha256 = "f4d27b2b04767a73c8644b5bd4498f2c3352f27fc32949003e439721fe1f1d60";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/librebaskerville/LibreBaskerville-Bold.ttf?raw=true";
      name = "LibreBaskerville-Bold.ttf";
      sha256 = "899d2122e69d869b5ec7474b316ddb5be804f205d6b3e668a9d8b9ea09ed6f6f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBaskerville-Regular.ttf $out/share/fonts/truetype/LibreBaskerville-Regular.ttf
     install -Dm644 LibreBaskerville-Italic.ttf $out/share/fonts/truetype/LibreBaskerville-Italic.ttf
     install -Dm644 LibreBaskerville-Bold.ttf $out/share/fonts/truetype/LibreBaskerville-Bold.ttf
  '';

  meta = with lib; {
    description = "Libre Baskerville";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
