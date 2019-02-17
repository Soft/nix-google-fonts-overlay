{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mrs-sheppards-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/mrssheppards/MrsSheppards-Regular.ttf?raw=true";
      name = "MrsSheppards-Regular.ttf";
      sha256 = "0fa5f282a2ad512d3d5d276fc6d4796fe4fda0fc0612d8687113d5423c8c33d8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MrsSheppards-Regular.ttf $out/share/fonts/truetype/MrsSheppards-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Mrs Sheppards";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
