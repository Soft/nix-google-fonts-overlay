{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "racing-sans-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/racingsansone/RacingSansOne-Regular.ttf?raw=true";
      name = "RacingSansOne-Regular.ttf";
      sha256 = "8b5cada83e3e4692f624f1b583a069b34e457e07a4210ceddbb1133b3383673e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RacingSansOne-Regular.ttf $out/share/fonts/truetype/RacingSansOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Racing Sans One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
