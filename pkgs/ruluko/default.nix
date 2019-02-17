{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ruluko-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ruluko/Ruluko-Regular.ttf?raw=true";
      name = "Ruluko-Regular.ttf";
      sha256 = "c426db1373755d3ba00456dece5cf5ad1c8023978f60cbfe7b7e256ab1c89c3f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ruluko-Regular.ttf $out/share/fonts/truetype/Ruluko-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Ruluko";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
