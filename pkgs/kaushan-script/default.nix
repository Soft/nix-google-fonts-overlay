{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kaushan-script-${version}";
  version = "2016-05-26-000618";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/kaushanscript/KaushanScript-Regular.ttf?raw=true";
      name = "KaushanScript-Regular.ttf";
      sha256 = "6d8d379d9bba98178bee476d68114c8f83812c18005ecccf679e70f60e03d8f6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KaushanScript-Regular.ttf $out/share/fonts/truetype/KaushanScript-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Kaushan Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
