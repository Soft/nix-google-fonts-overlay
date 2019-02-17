{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gidugu-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/gidugu/Gidugu-Regular.ttf?raw=true";
      name = "Gidugu-Regular.ttf";
      sha256 = "2faefcf5acdcd2e616348da9bc7bc18def2d6a0f7e7f6d357cac5c5b134c8888";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gidugu-Regular.ttf $out/share/fonts/truetype/Gidugu-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Gidugu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
