{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "boogaloo-${version}";
  version = "2017-08-07-194852";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b0a337cd0bd38663c1ff47e55b1a1c04ddea459a/ofl/boogaloo/Boogaloo-Regular.ttf?raw=true";
      name = "Boogaloo-Regular.ttf";
      sha256 = "c38febf770bec2b8e30ea6bc1ddb39c9b0ce0e8625d94ceeafbe3af1c7096d9d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Boogaloo-Regular.ttf $out/share/fonts/truetype/Boogaloo-Regular.ttf
  '';

  meta = with lib; {
    description = "Boogaloo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
