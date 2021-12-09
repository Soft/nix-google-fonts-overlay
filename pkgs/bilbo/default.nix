{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bilbo-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/254c91e36fdc280956e8e44b01bcac0e68dcffcf/ofl/bilbo/Bilbo-Regular.ttf?raw=true";
      name = "Bilbo-Regular.ttf";
      sha256 = "51cb6c2772c48a8f9f4b06a83ded0ba3342fc94a35b5dfffa87a9a3a9e3573bd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bilbo-Regular.ttf $out/share/fonts/truetype/Bilbo-Regular.ttf
  '';

  meta = with lib; {
    description = "Bilbo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
