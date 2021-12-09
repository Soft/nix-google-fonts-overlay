{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alex-brush-${version}";
  version = "2017-05-09-135507";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/355221c0687130fd04d8d27879889df42f3ac778/ofl/alexbrush/AlexBrush-Regular.ttf?raw=true";
      name = "AlexBrush-Regular.ttf";
      sha256 = "608a08fc92ae99c2d9d3819cdc4d41acfe3693b6e32c7255f3ee22a06db36567";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlexBrush-Regular.ttf $out/share/fonts/truetype/AlexBrush-Regular.ttf
  '';

  meta = with lib; {
    description = "Alex Brush";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
