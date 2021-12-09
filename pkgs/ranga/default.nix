{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ranga-${version}";
  version = "2017-05-09-184945";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e525c4f5ba006c03bae6f8599733d6ae0e9b326a/ofl/ranga/Ranga-Regular.ttf?raw=true";
      name = "Ranga-Regular.ttf";
      sha256 = "e51a6898e34d12bd9b9057002e645f176d30f5e821bfaa1ccc4e56294af7099a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e525c4f5ba006c03bae6f8599733d6ae0e9b326a/ofl/ranga/Ranga-Bold.ttf?raw=true";
      name = "Ranga-Bold.ttf";
      sha256 = "c5c763628e805a2af3c9deb68abd0b70227a98911f7ba56f4f8c2a3e8c286b96";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ranga-Regular.ttf $out/share/fonts/truetype/Ranga-Regular.ttf
     install -Dm644 Ranga-Bold.ttf $out/share/fonts/truetype/Ranga-Bold.ttf
  '';

  meta = with lib; {
    description = "Ranga";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
