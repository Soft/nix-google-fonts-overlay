{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "metamorphous-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/metamorphous/Metamorphous-Regular.ttf?raw=true";
      name = "Metamorphous-Regular.ttf";
      sha256 = "55939a5664e06807e87fa4af64f52039ead12f002dda8317393fdce2f7ff57fe";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Metamorphous-Regular.ttf $out/share/fonts/truetype/Metamorphous-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Metamorphous";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
