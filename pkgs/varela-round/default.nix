{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "varela-round-${version}";
  version = "2016-12-01-175153";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/95ac1b72896a65115a3d4c7b2b2deeeff9fbb9ba/ofl/varelaround/VarelaRound-Regular.ttf?raw=true";
      name = "VarelaRound-Regular.ttf";
      sha256 = "9a366a28b9fc548132c93c06d35569f0e900ea83a38d9cdecb3123bedda146b1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 VarelaRound-Regular.ttf $out/share/fonts/truetype/VarelaRound-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Varela Round";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
