{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "black-and-white-picture-${version}";
  version = "2018-03-13-164329";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/blackandwhitepicture/BlackAndWhitePicture-Regular.ttf?raw=true";
      name = "BlackAndWhitePicture-Regular.ttf";
      sha256 = "4d72cd6de1f210b446c86f06b4e13d7641cbcfb1b375c6927341388aa8e08056";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BlackAndWhitePicture-Regular.ttf $out/share/fonts/truetype/BlackAndWhitePicture-Regular.ttf
  '';

  meta = with lib; {
    description = "Black And White Picture";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
