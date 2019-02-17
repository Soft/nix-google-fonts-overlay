{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "crushed-${version}";
  version = "2017-08-07-204252";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8af024d4929a3781b07e331c71e27c9ecad47917/apache/crushed/Crushed-Regular.ttf?raw=true";
      name = "Crushed-Regular.ttf";
      sha256 = "ce930a0ae7db21bc6d6fb08fc9964e84bf0ecaa60a6fde560d3d2a4ae0949a1a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Crushed-Regular.ttf $out/share/fonts/truetype/Crushed-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Crushed";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
