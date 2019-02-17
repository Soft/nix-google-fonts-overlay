{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "indie-flower-${version}";
  version = "2016-11-01-164845";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/48e30c13625133283f79042e86693a5d04c6bfa0/ofl/indieflower/IndieFlower-Regular.ttf?raw=true";
      name = "IndieFlower-Regular.ttf";
      sha256 = "ccc94b22b156e9c5dfe50fd051f01b097600b252c24473e624bb43a143140a94";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IndieFlower-Regular.ttf $out/share/fonts/truetype/IndieFlower-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Indie Flower";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
