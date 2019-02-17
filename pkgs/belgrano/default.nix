{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "belgrano-${version}";
  version = "2017-08-07-195537";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/162b8ed636547bdbdb0592ba206b2986f13633d3/ofl/belgrano/Belgrano-Regular.ttf?raw=true";
      name = "Belgrano-Regular.ttf";
      sha256 = "5bf095dfbc56718bea7d74c0b30c36413714aaf8833d2cb012b604b64fd383d9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Belgrano-Regular.ttf $out/share/fonts/truetype/Belgrano-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Belgrano";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
