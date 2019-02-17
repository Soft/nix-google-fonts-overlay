{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "suravaram-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/suravaram/Suravaram-Regular.ttf?raw=true";
      name = "Suravaram-Regular.ttf";
      sha256 = "67c8e0d9e78c3eef2924bfe54b7462e9875ff42fe37abbe3e601ad6a9ada0f9c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Suravaram-Regular.ttf $out/share/fonts/truetype/Suravaram-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Suravaram";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
