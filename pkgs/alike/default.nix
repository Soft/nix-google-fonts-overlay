{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alike-${version}";
  version = "2017-05-01-171802";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7f63f6f0193c0fec43d78623d5ffa14e50b053b1/ofl/alike/Alike-Regular.ttf?raw=true";
      name = "Alike-Regular.ttf";
      sha256 = "1c797dda829ec3ef077dc9d1538a95054d83f233f389adebfaa39a96b20b9dfc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Alike-Regular.ttf $out/share/fonts/truetype/Alike-Regular.ttf
  '';

  meta = with lib; {
    description = "Alike";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
