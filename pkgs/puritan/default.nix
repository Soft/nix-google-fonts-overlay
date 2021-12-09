{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "puritan-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/puritan/Puritan-Regular.ttf?raw=true";
      name = "Puritan-Regular.ttf";
      sha256 = "c1bb23393a4b47cee290d4b371dc2ad812e2c806767bad7d2dd2f08c6d9f75ed";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/puritan/Puritan-Italic.ttf?raw=true";
      name = "Puritan-Italic.ttf";
      sha256 = "2cb8e3d29b08f21a693ace2ba43deaf030f9191205e067a9f82535d742c18f9e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/puritan/Puritan-Bold.ttf?raw=true";
      name = "Puritan-Bold.ttf";
      sha256 = "64e6d13582c1bc2dcab45f2f7be46362a11d108da84b4480e0339ef9c93486d1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/puritan/Puritan-BoldItalic.ttf?raw=true";
      name = "Puritan-BoldItalic.ttf";
      sha256 = "121700e1a92a307b4aaf1e908bd713cc9afe9500d33b5db4f81d0d13df1f64b4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Puritan-Regular.ttf $out/share/fonts/truetype/Puritan-Regular.ttf
     install -Dm644 Puritan-Italic.ttf $out/share/fonts/truetype/Puritan-Italic.ttf
     install -Dm644 Puritan-Bold.ttf $out/share/fonts/truetype/Puritan-Bold.ttf
     install -Dm644 Puritan-BoldItalic.ttf $out/share/fonts/truetype/Puritan-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Puritan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
