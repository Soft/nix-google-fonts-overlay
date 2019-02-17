{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "metal-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/metal/Metal.ttf?raw=true";
      name = "Metal.ttf";
      sha256 = "270a7045adfbcc335e50b4fbb4c24f1c58f15393ded13a1d87bfbbbe57bfb8ae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Metal.ttf $out/share/fonts/truetype/Metal.ttf
  '';

  meta = with stdenv.lib; {
    description = "Metal";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
