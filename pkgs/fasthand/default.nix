{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fasthand-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bacec3651f66c2e219e20a9a0d0aa0286c74a777/ofl/fasthand/Fasthand-Regular.ttf?raw=true";
      name = "Fasthand-Regular.ttf";
      sha256 = "85ba3b935f1b37eeddf0b5808dd7ce5d1cf4899a2ceaae56db2b6193921f86e0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fasthand-Regular.ttf $out/share/fonts/truetype/Fasthand-Regular.ttf
  '';

  meta = with lib; {
    description = "Fasthand";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
