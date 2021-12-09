{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "redressed-${version}";
  version = "2017-08-07-205030";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f677032495a8f645cd582c084df67cebd5bbee56/apache/redressed/Redressed-Regular.ttf?raw=true";
      name = "Redressed-Regular.ttf";
      sha256 = "e7063f1abd35c048ad22c5e52232d9503f3106376f3de7f38125c3a543ba6598";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Redressed-Regular.ttf $out/share/fonts/truetype/Redressed-Regular.ttf
  '';

  meta = with lib; {
    description = "Redressed";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
