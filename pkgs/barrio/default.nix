{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "barrio-${version}";
  version = "2016-12-03-215315";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f10784f5c52eab5dff74c4aa970558da6c07df40/ofl/barrio/Barrio-Regular.ttf?raw=true";
      name = "Barrio-Regular.ttf";
      sha256 = "6f86249fbed4d0d620bcfefda64a0081e15cf0c8c5fd2ad17db157b98b558bc5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Barrio-Regular.ttf $out/share/fonts/truetype/Barrio-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Barrio";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
