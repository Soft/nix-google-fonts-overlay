{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-bhai-${version}";
  version = "2017-08-07-185248";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3a5cecd3768b8fec8e66780e87f8ad3a2e998ee8/ofl/baloobhai/BalooBhai-Regular.ttf?raw=true";
      name = "BalooBhai-Regular.ttf";
      sha256 = "a99043cefbb1179f48221bf54b9ecc333042d83e7ff32d9bf578d3a7e5b690f1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooBhai-Regular.ttf $out/share/fonts/truetype/BalooBhai-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Baloo Bhai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
