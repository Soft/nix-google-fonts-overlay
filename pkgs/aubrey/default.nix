{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aubrey-${version}";
  version = "2017-08-07-195948";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9fe318418f68ca06f8d6967710037b539857d4a7/ofl/aubrey/Aubrey-Regular.ttf?raw=true";
      name = "Aubrey-Regular.ttf";
      sha256 = "e991cb2b346b96fcf98baa3f1bf39cb1fa91deee1484c7510fd3e0141cec7d13";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Aubrey-Regular.ttf $out/share/fonts/truetype/Aubrey-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Aubrey";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
