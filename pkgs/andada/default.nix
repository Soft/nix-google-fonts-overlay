{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "andada-${version}";
  version = "2017-08-07-203221";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acfbd3bc3fa39d6d6d3b7a3f40c4c82d423f6768/ofl/andada/Andada-Regular.ttf?raw=true";
      name = "Andada-Regular.ttf";
      sha256 = "b1dec954c652d9b2b82d15e99c5efd85db62858e57b676f9e51adcdbeeefe2e8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Andada-Regular.ttf $out/share/fonts/truetype/Andada-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Andada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
