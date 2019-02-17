{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kristi-${version}";
  version = "2017-05-08-221918";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1ac6f76ab672f0f9854a5eea883893a6fb2971f5/ofl/kristi/Kristi-Regular.ttf?raw=true";
      name = "Kristi-Regular.ttf";
      sha256 = "6725b7a28d9bd8761e2834a6ab380babe073678c6f42017fe576116b9d6fd2a0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kristi-Regular.ttf $out/share/fonts/truetype/Kristi-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Kristi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
