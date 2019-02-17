{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sree-krushnadevaraya-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sreekrushnadevaraya/SreeKrushnadevaraya-Regular.ttf?raw=true";
      name = "SreeKrushnadevaraya-Regular.ttf";
      sha256 = "3b8f5b01a08fba5af53760e274d6cd7ea6514ec2658d9c480eafcc8917d7e2cb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SreeKrushnadevaraya-Regular.ttf $out/share/fonts/truetype/SreeKrushnadevaraya-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Sree Krushnadevaraya";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
