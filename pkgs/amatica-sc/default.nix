{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amatica-sc-${version}";
  version = "2017-05-23-165112";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c365c5b77d6f242cfac9a3c6b9cdd17448152576/ofl/amaticasc/AmaticaSC-Regular.ttf?raw=true";
      name = "AmaticaSC-Regular.ttf";
      sha256 = "a856e7ece21d97dbceb6e6343d350ba39559024cf30f03a38ff8a189ebd5eb30";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c365c5b77d6f242cfac9a3c6b9cdd17448152576/ofl/amaticasc/AmaticaSC-Bold.ttf?raw=true";
      name = "AmaticaSC-Bold.ttf";
      sha256 = "54e4168dc3ab85fb589e3193d09d88691049e98925eb99b07b13e9f7158f8278";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AmaticaSC-Regular.ttf $out/share/fonts/truetype/AmaticaSC-Regular.ttf
     install -Dm644 AmaticaSC-Bold.ttf $out/share/fonts/truetype/AmaticaSC-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Amatica SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
