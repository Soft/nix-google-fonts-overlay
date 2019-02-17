{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "koulen-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/koulen/Koulen.ttf?raw=true";
      name = "Koulen.ttf";
      sha256 = "3dafea7b3be54b04f5a5df716f9b74e4a28c43593c3ecc8ce99a984bce20e230";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Koulen.ttf $out/share/fonts/truetype/Koulen.ttf
  '';

  meta = with stdenv.lib; {
    description = "Koulen";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
