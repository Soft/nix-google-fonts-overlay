{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "didact-gothic-${version}";
  version = "2017-01-25-171344";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4be3f642b64e428908c337fd95a1ef79c3a6c595/ofl/didactgothic/DidactGothic-Regular.ttf?raw=true";
      name = "DidactGothic-Regular.ttf";
      sha256 = "b98f9e091b6337a86f4e0f69c94c31905e1e287782853f472e176b4e28d3f81f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DidactGothic-Regular.ttf $out/share/fonts/truetype/DidactGothic-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Didact Gothic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
