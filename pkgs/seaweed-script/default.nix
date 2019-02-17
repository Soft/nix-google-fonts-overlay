{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "seaweed-script-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/seaweedscript/SeaweedScript-Regular.ttf?raw=true";
      name = "SeaweedScript-Regular.ttf";
      sha256 = "48a7f01ce3f307b532c9c5f8582a8ed87883389933b311b8e3704e8798ba4bc7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SeaweedScript-Regular.ttf $out/share/fonts/truetype/SeaweedScript-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Seaweed Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
