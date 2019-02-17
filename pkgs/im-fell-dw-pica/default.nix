{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "im-fell-dw-pica-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/imfelldwpica/IMFePIrm28P.ttf?raw=true";
      name = "IMFePIrm28P.ttf";
      sha256 = "f65e54016dfab4222ba552cfb82260b14a7df6527cce66430f5f66022addb052";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/imfelldwpica/IMFePIit28P.ttf?raw=true";
      name = "IMFePIit28P.ttf";
      sha256 = "e09a00654b5dd266aee743c0c43d129c8404a2d5e0ebf27e5a0e472bd1900b8d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IMFePIrm28P.ttf $out/share/fonts/truetype/IMFePIrm28P.ttf
     install -Dm644 IMFePIit28P.ttf $out/share/fonts/truetype/IMFePIit28P.ttf
  '';

  meta = with stdenv.lib; {
    description = "IM Fell DW Pica";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
