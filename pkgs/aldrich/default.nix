{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aldrich-${version}";
  version = "2017-05-01-171822";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c0aae12255fb572220ecc549d465248d63954169/ofl/aldrich/Aldrich-Regular.ttf?raw=true";
      name = "Aldrich-Regular.ttf";
      sha256 = "bcabd8e6db3e8cb59242e8dbdef30bfd9b25be600e2e8f506618008f99138d47";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Aldrich-Regular.ttf $out/share/fonts/truetype/Aldrich-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Aldrich";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
