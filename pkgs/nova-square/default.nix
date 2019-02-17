{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nova-square-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/novasquare/NovaSquare.ttf?raw=true";
      name = "NovaSquare.ttf";
      sha256 = "bf7d8725e2fed1984cadbcb4e54d67cd898f042e11c14e9c30074b14dab6963f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NovaSquare.ttf $out/share/fonts/truetype/NovaSquare.ttf
  '';

  meta = with stdenv.lib; {
    description = "Nova Square";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
