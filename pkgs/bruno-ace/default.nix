{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bruno-ace-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/brunoace/BrunoAce-Regular.ttf?raw=true";
      name = "BrunoAce-Regular.ttf";
      sha256 = "8b7f7b78a83b0ed655b479e6a6cc8e1b133f271e2f10882dbc2e0501794ec71e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BrunoAce-Regular.ttf $out/share/fonts/truetype/BrunoAce-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Bruno Ace";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
