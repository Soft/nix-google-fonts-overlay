{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "unkempt-${version}";
  version = "2017-08-07-205638";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/edec1f84645d00247c531832babbccb36b2668bd/apache/unkempt/Unkempt-Regular.ttf?raw=true";
      name = "Unkempt-Regular.ttf";
      sha256 = "512ce8e7226e0009307f10d47c08ee9a9878690766579ff28c5b1dddfa179f4c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/edec1f84645d00247c531832babbccb36b2668bd/apache/unkempt/Unkempt-Bold.ttf?raw=true";
      name = "Unkempt-Bold.ttf";
      sha256 = "9dd344f69eb53372db32b5d7558f2addb3d159f4723b8b39364514d8e032a631";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Unkempt-Regular.ttf $out/share/fonts/truetype/Unkempt-Regular.ttf
     install -Dm644 Unkempt-Bold.ttf $out/share/fonts/truetype/Unkempt-Bold.ttf
  '';

  meta = with lib; {
    description = "Unkempt";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
