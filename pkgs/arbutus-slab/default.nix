{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arbutus-slab-${version}";
  version = "2017-08-07-203005";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dbe4135303df255625a2b744b7eb8a260fb8ce16/ofl/arbutusslab/ArbutusSlab-Regular.ttf?raw=true";
      name = "ArbutusSlab-Regular.ttf";
      sha256 = "f4f55a6e95aa0dcad40077d4b4e9f7d0269ed2ca448134917c97d59c474e511c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ArbutusSlab-Regular.ttf $out/share/fonts/truetype/ArbutusSlab-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Arbutus Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
