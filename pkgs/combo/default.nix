{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "combo-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/combo/Combo-Regular.ttf?raw=true";
      name = "Combo-Regular.ttf";
      sha256 = "e714674117c2864bf7407e2ebfafb11e581e97480286fa01b419adda94d08686";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Combo-Regular.ttf $out/share/fonts/truetype/Combo-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Combo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
