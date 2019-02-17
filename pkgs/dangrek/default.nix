{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dangrek-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/dangrek/Dangrek.ttf?raw=true";
      name = "Dangrek.ttf";
      sha256 = "2148e6eaa36456d6a9cdafd19aad553366ac78a2e720556a5710812a57b47782";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dangrek.ttf $out/share/fonts/truetype/Dangrek.ttf
  '';

  meta = with stdenv.lib; {
    description = "Dangrek";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
