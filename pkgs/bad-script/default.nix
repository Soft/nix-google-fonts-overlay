{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bad-script-${version}";
  version = "2016-10-14-100002";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/235f2c1aaec5b2febe07cc0b2b9a41c7152e3233/ofl/badscript/BadScript-Regular.ttf?raw=true";
      name = "BadScript-Regular.ttf";
      sha256 = "a34dc4a654dea3ff64afc5e45ecc19079a333d760681febb78324a56dd1c7753";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BadScript-Regular.ttf $out/share/fonts/truetype/BadScript-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Bad Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
