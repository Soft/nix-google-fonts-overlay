{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bowlby-one-${version}";
  version = "2017-08-07-194843";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5df13fc147bd59c2bef2746ae1707fcfe058fd4e/ofl/bowlbyone/BowlbyOne-Regular.ttf?raw=true";
      name = "BowlbyOne-Regular.ttf";
      sha256 = "c46a806d7b51fd4987e5f0be449fe40a944cb407e43290ce1cdeed029a8cdc1d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BowlbyOne-Regular.ttf $out/share/fonts/truetype/BowlbyOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Bowlby One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
