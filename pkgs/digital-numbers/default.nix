{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "digital-numbers-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e860dd8502bff9c68f345ed29e82fe929038f4d6/ofl/digitalnumbers/DigitalNumbers-Regular.ttf?raw=true";
      name = "DigitalNumbers-Regular.ttf";
      sha256 = "de9e0cfb83bc10ac6fad876f35d8f381a3ff07f5ca9925919e9d32f980bc9d49";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DigitalNumbers-Regular.ttf $out/share/fonts/truetype/DigitalNumbers-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Digital Numbers";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
