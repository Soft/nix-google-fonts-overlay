{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "acme-${version}";
  version = "2017-05-01-172009";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a84ec9834c4293bde19686d7ba5e515e8aa3a106/ofl/acme/Acme-Regular.ttf?raw=true";
      name = "Acme-Regular.ttf";
      sha256 = "76fdb582f54653c27274d5cd986f994c28d7fa7d323e7eb9ee14ce8875d39dc4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Acme-Regular.ttf $out/share/fonts/truetype/Acme-Regular.ttf
  '';

  meta = with lib; {
    description = "Acme";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
