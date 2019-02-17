{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "la-belle-aurore-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/labelleaurore/LaBelleAurore.ttf?raw=true";
      name = "LaBelleAurore.ttf";
      sha256 = "ed67462999e05f0cdac92f686374661e4d68c56fdcd7d05725c6df7b41eabd2a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LaBelleAurore.ttf $out/share/fonts/truetype/LaBelleAurore.ttf
  '';

  meta = with stdenv.lib; {
    description = "La Belle Aurore";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
