{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wallpoet-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/wallpoet/Wallpoet-Regular.ttf?raw=true";
      name = "Wallpoet-Regular.ttf";
      sha256 = "0d8dc36abe195fa455a5a9f60a29f0aa29c7404bf880a67ec71f047dabefb02b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Wallpoet-Regular.ttf $out/share/fonts/truetype/Wallpoet-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Wallpoet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
