{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "scheherazade-${version}";
  version = "2016-09-26-145146";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/scheherazade/Scheherazade-Regular.ttf?raw=true";
      name = "Scheherazade-Regular.ttf";
      sha256 = "034c3ed203ccf91e20a75181350759cc5878e0e369bb0e2e83acee15a829184f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/scheherazade/Scheherazade-Bold.ttf?raw=true";
      name = "Scheherazade-Bold.ttf";
      sha256 = "62dde529b296df074efbf75b40a986e8ff82e997b98cec9ad7ab6795bb17a622";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Scheherazade-Regular.ttf $out/share/fonts/truetype/Scheherazade-Regular.ttf
     install -Dm644 Scheherazade-Bold.ttf $out/share/fonts/truetype/Scheherazade-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Scheherazade";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
