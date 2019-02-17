{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "play-${version}";
  version = "2017-05-01-173556";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e36afc7567e2c4dbe669ca5810e0c77f307295a0/ofl/play/Play-Regular.ttf?raw=true";
      name = "Play-Regular.ttf";
      sha256 = "eed0da79005cab35d6ed0eacab594ed67cc643be0b2632fa9e440b3bc5078dc4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e36afc7567e2c4dbe669ca5810e0c77f307295a0/ofl/play/Play-Bold.ttf?raw=true";
      name = "Play-Bold.ttf";
      sha256 = "45c572eccda4cf335165b750345258e753035bf48ee2fdf37faa07c7db88bce0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Play-Regular.ttf $out/share/fonts/truetype/Play-Regular.ttf
     install -Dm644 Play-Bold.ttf $out/share/fonts/truetype/Play-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Play";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
