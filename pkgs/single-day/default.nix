{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "single-day-${version}";
  version = "2018-03-13-205649";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/81997650b429cd0b3fdfc330a35664673074b31e/ofl/singleday/SingleDay-Regular.ttf?raw=true";
      name = "SingleDay-Regular.ttf";
      sha256 = "716ff67a4b0675b35c26d60a4bb83173f7d153ab754474ed36c3369593ca1ca8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SingleDay-Regular.ttf $out/share/fonts/truetype/SingleDay-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Single Day";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
