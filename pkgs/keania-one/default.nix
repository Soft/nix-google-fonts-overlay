{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "keania-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/keaniaone/KeaniaOne-Regular.ttf?raw=true";
      name = "KeaniaOne-Regular.ttf";
      sha256 = "55c6be3d0cdc816c462bccbcc935ef20f560bd7aecbf1b38caed4752b52c14c0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KeaniaOne-Regular.ttf $out/share/fonts/truetype/KeaniaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Keania One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
