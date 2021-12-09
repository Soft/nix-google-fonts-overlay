{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yeon-sung-${version}";
  version = "2018-03-13-164329";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/yeonsung/YeonSung-Regular.ttf?raw=true";
      name = "YeonSung-Regular.ttf";
      sha256 = "8e5ff1cc1b1302afac8b9ee5296a04bc1c92af1e67a2ae07a593aa6b5e3eb792";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YeonSung-Regular.ttf $out/share/fonts/truetype/YeonSung-Regular.ttf
  '';

  meta = with lib; {
    description = "Yeon Sung";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
