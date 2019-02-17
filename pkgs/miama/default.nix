{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "miama-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/miama/Miama-Regular.ttf?raw=true";
      name = "Miama-Regular.ttf";
      sha256 = "2dfff84eb0d46ac727e99438417e244d3a92e4d09b26c3039b40d640f07aba6b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Miama-Regular.ttf $out/share/fonts/truetype/Miama-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Miama";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
