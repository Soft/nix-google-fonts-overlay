{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rock-salt-${version}";
  version = "2017-08-07-205049";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f33cb5d999f10475b814d1fd9338b2ee110b49d8/apache/rocksalt/RockSalt-Regular.ttf?raw=true";
      name = "RockSalt-Regular.ttf";
      sha256 = "c5421d1ced1949488f29d11b75b7ef967abe2d870f816246bf18fdc0f3e29c96";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RockSalt-Regular.ttf $out/share/fonts/truetype/RockSalt-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Rock Salt";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
