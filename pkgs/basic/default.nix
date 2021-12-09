{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "basic-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9db9820a4304b094946a98f3c71cc93c68e37b6f/ofl/basic/Basic-Regular.ttf?raw=true";
      name = "Basic-Regular.ttf";
      sha256 = "077f7245f6459045495b1ca0493f2b426c421d2112d10b48a38ff8858a07397a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Basic-Regular.ttf $out/share/fonts/truetype/Basic-Regular.ttf
  '';

  meta = with lib; {
    description = "Basic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
