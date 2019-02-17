{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "original-surfer-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/originalsurfer/OriginalSurfer-Regular.ttf?raw=true";
      name = "OriginalSurfer-Regular.ttf";
      sha256 = "ee4a42820b224a1934f2ba0997958d7965ad34762d88244fbffddb0b0ae488e4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OriginalSurfer-Regular.ttf $out/share/fonts/truetype/OriginalSurfer-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Original Surfer";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
