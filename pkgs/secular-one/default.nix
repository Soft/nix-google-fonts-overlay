{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "secular-one-${version}";
  version = "2017-05-23-170946";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b514022df12f0ab0aee9ea02abb5069c1d8f66f3/ofl/secularone/SecularOne-Regular.ttf?raw=true";
      name = "SecularOne-Regular.ttf";
      sha256 = "27cc245434a1982061170b9bce097b473e0165567030552d7c2451ec01262748";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SecularOne-Regular.ttf $out/share/fonts/truetype/SecularOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Secular One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
