{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lustria-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lustria/Lustria-Regular.ttf?raw=true";
      name = "Lustria-Regular.ttf";
      sha256 = "8b50753779d151674dcc74bdf9cdde1e788d8fb2b9ace8fb183a0def0f7361ce";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lustria-Regular.ttf $out/share/fonts/truetype/Lustria-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Lustria";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
