{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "euphoria-script-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/euphoriascript/EuphoriaScript-Regular.ttf?raw=true";
      name = "EuphoriaScript-Regular.ttf";
      sha256 = "1ca81517a450506290e2be25648e153ee4c9cf6acc44c1d610b1e6d7e0e67484";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EuphoriaScript-Regular.ttf $out/share/fonts/truetype/EuphoriaScript-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Euphoria Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
