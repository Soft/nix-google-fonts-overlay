{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dynalight-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/dynalight/Dynalight-Regular.ttf?raw=true";
      name = "Dynalight-Regular.ttf";
      sha256 = "360da5d767b48c849d06a608a4605d53c32a49fde127603aa83b096b6b43d0f1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dynalight-Regular.ttf $out/share/fonts/truetype/Dynalight-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Dynalight";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
