{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "swanky-and-moo-moo-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/swankyandmoomoo/SwankyandMooMoo.ttf?raw=true";
      name = "SwankyandMooMoo.ttf";
      sha256 = "a745effa8961790717966f7c69d96756a7abe2d334a08be333a656b7c54b627f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SwankyandMooMoo.ttf $out/share/fonts/truetype/SwankyandMooMoo.ttf
  '';

  meta = with stdenv.lib; {
    description = "Swanky and Moo Moo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
