{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rationale-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/rationale/Rationale-Regular.ttf?raw=true";
      name = "Rationale-Regular.ttf";
      sha256 = "744e163c734a06bd20da3737d0cc4ceb8dc5a8c09fdfd4e9feacbeddd2081c5c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rationale-Regular.ttf $out/share/fonts/truetype/Rationale-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Rationale";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
