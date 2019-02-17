{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alef-${version}";
  version = "2017-05-01-171817";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/351666924b119ccb95127be142e0c2f77d5b866f/ofl/alef/Alef-Regular.ttf?raw=true";
      name = "Alef-Regular.ttf";
      sha256 = "a32adcc953ac356906901778460083dc207d4560cb586fd9ea24ec5b186969ed";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/351666924b119ccb95127be142e0c2f77d5b866f/ofl/alef/Alef-Bold.ttf?raw=true";
      name = "Alef-Bold.ttf";
      sha256 = "5dae0d7b2365288d8a34f5fb033d4278be96cef2547862cb93ceb8373e10bcf1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Alef-Regular.ttf $out/share/fonts/truetype/Alef-Regular.ttf
     install -Dm644 Alef-Bold.ttf $out/share/fonts/truetype/Alef-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Alef";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
