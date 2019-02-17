{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rammetto-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/rammettoone/RammettoOne-Regular.ttf?raw=true";
      name = "RammettoOne-Regular.ttf";
      sha256 = "2e42c03b2df082392e5dfe3fcb74d25b6b415eedc83794d61a97e4377208db9d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RammettoOne-Regular.ttf $out/share/fonts/truetype/RammettoOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Rammetto One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
