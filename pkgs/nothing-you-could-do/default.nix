{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nothing-you-could-do-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/nothingyoucoulddo/NothingYouCouldDo.ttf?raw=true";
      name = "NothingYouCouldDo.ttf";
      sha256 = "1daf8cf79076bf59c5a9117b5efd6ecea35e57a05ef127fe4f95b072b8a5245d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NothingYouCouldDo.ttf $out/share/fonts/truetype/NothingYouCouldDo.ttf
  '';

  meta = with lib; {
    description = "Nothing You Could Do";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
