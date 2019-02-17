{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "forum-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/forum/Forum-Regular.ttf?raw=true";
      name = "Forum-Regular.ttf";
      sha256 = "5c9fbe9c4ce76d0269f5088d921d57e58082fd9c28433eacb6de95baf938adf8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Forum-Regular.ttf $out/share/fonts/truetype/Forum-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Forum";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
