{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "eater-caps-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/eatercaps/EaterCaps-Regular.ttf?raw=true";
      name = "EaterCaps-Regular.ttf";
      sha256 = "7ec20d2d7285870184f9b3de56f5641408fa725d9c57d48b70698732847362ee";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EaterCaps-Regular.ttf $out/share/fonts/truetype/EaterCaps-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Eater Caps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
