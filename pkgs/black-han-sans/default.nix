{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "black-han-sans-${version}";
  version = "2018-03-13-195732";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/blackhansans/BlackHanSans-Regular.ttf?raw=true";
      name = "BlackHanSans-Regular.ttf";
      sha256 = "aca8ccf739b3309e1f2c29bc58acda0465c392ab2d254f624e45ffdab757706c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BlackHanSans-Regular.ttf $out/share/fonts/truetype/BlackHanSans-Regular.ttf
  '';

  meta = with lib; {
    description = "Black Han Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
