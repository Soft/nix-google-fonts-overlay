{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shrikhand-${version}";
  version = "2017-05-16-161621";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0cffc716084fe004545f47e7f77a007f26d3ca88/ofl/shrikhand/Shrikhand-Regular.ttf?raw=true";
      name = "Shrikhand-Regular.ttf";
      sha256 = "8ba32f6d6a96fb8dbc92fc1acfbc4d2123d5348063d89b2c3dd784e7afcb81af";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Shrikhand-Regular.ttf $out/share/fonts/truetype/Shrikhand-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Shrikhand";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
