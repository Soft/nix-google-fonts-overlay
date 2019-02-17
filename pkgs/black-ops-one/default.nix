{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "black-ops-one-${version}";
  version = "2017-08-07-195106";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/35b26b31773a8ca372d6430899d705822e021699/ofl/blackopsone/BlackOpsOne-Regular.ttf?raw=true";
      name = "BlackOpsOne-Regular.ttf";
      sha256 = "838f00508ccefff4a6bbdb3c1c6899a77c7e225b72d9609584ba807026a3c538";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BlackOpsOne-Regular.ttf $out/share/fonts/truetype/BlackOpsOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Black Ops One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
