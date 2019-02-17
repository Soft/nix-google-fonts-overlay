{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "domine-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/domine/Domine-Regular.ttf?raw=true";
      name = "Domine-Regular.ttf";
      sha256 = "506e373ccfe036ede8b8488e1beb2b86c3839ebe32b7a2dba43270164fcd443b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/domine/Domine-Bold.ttf?raw=true";
      name = "Domine-Bold.ttf";
      sha256 = "d3a54ebdf4811bb8aee01c9617e418ce9e5e0e8abcfd675f4b51adb2ad19446e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Domine-Regular.ttf $out/share/fonts/truetype/Domine-Regular.ttf
     install -Dm644 Domine-Bold.ttf $out/share/fonts/truetype/Domine-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Domine";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
