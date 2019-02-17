{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "duru-sans-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/durusans/DuruSans-Regular.ttf?raw=true";
      name = "DuruSans-Regular.ttf";
      sha256 = "edd15a5596318ecc635484f7b4fcb34c6dcaa7be8f85c4d2e9273ad8db688ff0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DuruSans-Regular.ttf $out/share/fonts/truetype/DuruSans-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Duru Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
