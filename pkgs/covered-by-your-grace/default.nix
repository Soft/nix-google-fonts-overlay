{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "covered-by-your-grace-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/coveredbyyourgrace/CoveredByYourGrace.ttf?raw=true";
      name = "CoveredByYourGrace.ttf";
      sha256 = "8a7e5687a4f9aad95243eb28cdc624009a335e0de5175113bc5f1348a4d67fd7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CoveredByYourGrace.ttf $out/share/fonts/truetype/CoveredByYourGrace.ttf
  '';

  meta = with stdenv.lib; {
    description = "Covered By Your Grace";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
