{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "orbitron-${version}";
  version = "2017-05-08-223359";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c8e3197f63e4ff7b487f69f76cf17bcc023c980c/ofl/orbitron/Orbitron-Regular.ttf?raw=true";
      name = "Orbitron-Regular.ttf";
      sha256 = "5cb600fd587eb95dad4de7586a19829f92575ac2fee806dc4e741644de6850f0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c8e3197f63e4ff7b487f69f76cf17bcc023c980c/ofl/orbitron/Orbitron-Medium.ttf?raw=true";
      name = "Orbitron-Medium.ttf";
      sha256 = "585378fba2b0ba839ccdc5edb94c6437103f9ce346d36569a598b83f31f76094";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c8e3197f63e4ff7b487f69f76cf17bcc023c980c/ofl/orbitron/Orbitron-Bold.ttf?raw=true";
      name = "Orbitron-Bold.ttf";
      sha256 = "f7b8cee3c4c2b21a9ab8dfc6c3c8731bf4f7633698cac007322c11dc2df38bcd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c8e3197f63e4ff7b487f69f76cf17bcc023c980c/ofl/orbitron/Orbitron-Black.ttf?raw=true";
      name = "Orbitron-Black.ttf";
      sha256 = "7208ea137a725eb36fe0091f9102ee48f2877ef0a33b81ebd9c5bf774ef30bd7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Orbitron-Regular.ttf $out/share/fonts/truetype/Orbitron-Regular.ttf
     install -Dm644 Orbitron-Medium.ttf $out/share/fonts/truetype/Orbitron-Medium.ttf
     install -Dm644 Orbitron-Bold.ttf $out/share/fonts/truetype/Orbitron-Bold.ttf
     install -Dm644 Orbitron-Black.ttf $out/share/fonts/truetype/Orbitron-Black.ttf
  '';

  meta = with lib; {
    description = "Orbitron";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
