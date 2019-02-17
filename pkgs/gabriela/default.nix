{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gabriela-${version}";
  version = "2017-01-17-072812";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/45b40149feae173672ac225998fadcdf8bd62186/ofl/gabriela/Gabriela-Regular.ttf?raw=true";
      name = "Gabriela-Regular.ttf";
      sha256 = "13fcca7764f57ed130810066904517cec12188edf5ae3de713cc91090ba3d654";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gabriela-Regular.ttf $out/share/fonts/truetype/Gabriela-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Gabriela";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
