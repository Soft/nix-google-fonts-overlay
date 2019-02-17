{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "grand-hotel-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/grandhotel/GrandHotel-Regular.ttf?raw=true";
      name = "GrandHotel-Regular.ttf";
      sha256 = "ec7ae65d49c936cb5ed32534ab74dbd40c56733de5145ac3aae9da362e02b50f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GrandHotel-Regular.ttf $out/share/fonts/truetype/GrandHotel-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Grand Hotel";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
