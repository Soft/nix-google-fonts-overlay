{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ntr-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ntr/NTR-Regular.ttf?raw=true";
      name = "NTR-Regular.ttf";
      sha256 = "c59000b9a002c2935b19afdceaa3aac9b0edefcfd213e3f64de0b172fda50b1d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NTR-Regular.ttf $out/share/fonts/truetype/NTR-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "NTR";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
