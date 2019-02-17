{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "miss-saint-delafield-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/misssaintdelafield/MrsSaintDelafield-Regular.ttf?raw=true";
      name = "MrsSaintDelafield-Regular.ttf";
      sha256 = "bec2af0b4bbb24f97abf51d9633b113d8e787315baa409bb655775f04634bd5e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MrsSaintDelafield-Regular.ttf $out/share/fonts/truetype/MrsSaintDelafield-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Miss Saint Delafield";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
