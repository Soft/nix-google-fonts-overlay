{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dhurjati-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/dhurjati/Dhurjati-Regular.ttf?raw=true";
      name = "Dhurjati-Regular.ttf";
      sha256 = "7f82ab141b77d263f9ea9b31b47faf50c11310f42fce6d9dffeaaa334909bbf9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dhurjati-Regular.ttf $out/share/fonts/truetype/Dhurjati-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Dhurjati";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
