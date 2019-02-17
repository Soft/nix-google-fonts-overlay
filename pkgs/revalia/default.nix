{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "revalia-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/revalia/Revalia-Regular.ttf?raw=true";
      name = "Revalia-Regular.ttf";
      sha256 = "a9313fba7bbeb5f9de6572c3e15ca53f2f608babff40cfa9e9008fff0c1e3c80";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Revalia-Regular.ttf $out/share/fonts/truetype/Revalia-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Revalia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
