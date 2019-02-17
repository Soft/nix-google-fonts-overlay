{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "major-mono-display-${version}";
  version = "2018-12-08-000149";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a6169376b6444326af92967811721c98b08ddc28/ofl/majormonodisplay/MajorMonoDisplay-Regular.ttf?raw=true";
      name = "MajorMonoDisplay-Regular.ttf";
      sha256 = "3f2ee71c2b8464f065bf960a148be81d68fcc13385df87737928f948208dffc6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MajorMonoDisplay-Regular.ttf $out/share/fonts/truetype/MajorMonoDisplay-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Major Mono Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
