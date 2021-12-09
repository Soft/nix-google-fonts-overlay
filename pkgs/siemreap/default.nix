{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "siemreap-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/siemreap/Siemreap.ttf?raw=true";
      name = "Siemreap.ttf";
      sha256 = "464760c6d06fc3f153f2e005eb1b0d33d5bd67e75f2d1c633f584c24ac006588";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Siemreap.ttf $out/share/fonts/truetype/Siemreap.ttf
  '';

  meta = with lib; {
    description = "Siemreap";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
