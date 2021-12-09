{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "redacted-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bacec3651f66c2e219e20a9a0d0aa0286c74a777/ofl/redacted/Redacted-Regular.ttf?raw=true";
      name = "Redacted-Regular.ttf";
      sha256 = "e434487bd93893fbc217d87cc31f082490c3954278a8f445467dee1aa6cd9d6e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Redacted-Regular.ttf $out/share/fonts/truetype/Redacted-Regular.ttf
  '';

  meta = with lib; {
    description = "Redacted";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
