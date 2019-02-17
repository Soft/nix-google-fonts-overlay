{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "michroma-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/michroma/Michroma.ttf?raw=true";
      name = "Michroma.ttf";
      sha256 = "cd93ff5e3aa344514f35c2d1be9239268ae667f9835a3aa01de61a2096278b7c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Michroma.ttf $out/share/fonts/truetype/Michroma.ttf
  '';

  meta = with stdenv.lib; {
    description = "Michroma";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
