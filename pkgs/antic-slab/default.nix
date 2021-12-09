{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "antic-slab-${version}";
  version = "2017-08-07-203029";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/29d7c65b584eef4881d7ea5cb5b52b714b2b5ccf/ofl/anticslab/AnticSlab-Regular.ttf?raw=true";
      name = "AnticSlab-Regular.ttf";
      sha256 = "bea5831a412ccf18bf34612a575d908b7892c4669fa91b80405cba508fc32a56";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnticSlab-Regular.ttf $out/share/fonts/truetype/AnticSlab-Regular.ttf
  '';

  meta = with lib; {
    description = "Antic Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
