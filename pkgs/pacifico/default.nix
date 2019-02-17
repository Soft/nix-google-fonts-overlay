{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pacifico-${version}";
  version = "2017-11-06-185014";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e9c0bd454c07ae4d4113030ad494e008a455fd7b/ofl/pacifico/Pacifico-Regular.ttf?raw=true";
      name = "Pacifico-Regular.ttf";
      sha256 = "5e8c9c1d067ebc5f79edb7fc8e1656ef7ac637f85fec51b167cf51fd79e3161a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Pacifico-Regular.ttf $out/share/fonts/truetype/Pacifico-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Pacifico";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
