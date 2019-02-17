{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pt-mono-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptmono/PTM55FT.ttf?raw=true";
      name = "PTM55FT.ttf";
      sha256 = "cbe732b3b8fd211fd986ebdfc9b870ddeca4faab0bb5425fc509b37f9b4ac804";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PTM55FT.ttf $out/share/fonts/truetype/PTM55FT.ttf
  '';

  meta = with stdenv.lib; {
    description = "PT Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
