{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lovers-quarrel-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/loversquarrel/LoversQuarrel-Regular.ttf?raw=true";
      name = "LoversQuarrel-Regular.ttf";
      sha256 = "e89f0c13189d3d8284b2324663863f6871f6c08ce9db678965d4c36f47311922";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LoversQuarrel-Regular.ttf $out/share/fonts/truetype/LoversQuarrel-Regular.ttf
  '';

  meta = with lib; {
    description = "Lovers Quarrel";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
