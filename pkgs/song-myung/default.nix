{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "song-myung-${version}";
  version = "2018-03-13-164329";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/songmyung/SongMyung-Regular.ttf?raw=true";
      name = "SongMyung-Regular.ttf";
      sha256 = "7f90ab20250911560212cc5819c7b205f9c6644bb96b65095d89fcae096bbf58";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SongMyung-Regular.ttf $out/share/fonts/truetype/SongMyung-Regular.ttf
  '';

  meta = with lib; {
    description = "Song Myung";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
