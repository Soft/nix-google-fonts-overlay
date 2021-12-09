{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fira-mono-${version}";
  version = "2016-12-02-171015";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/22d9fb782d20f88fc9952807408d0e56739cc43a/ofl/firamono/FiraMono-Regular.ttf?raw=true";
      name = "FiraMono-Regular.ttf";
      sha256 = "2e00b0cf3106a3d792f35711b7722740b76c02ee7300ea8c60f940584b7a8ac9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/22d9fb782d20f88fc9952807408d0e56739cc43a/ofl/firamono/FiraMono-Medium.ttf?raw=true";
      name = "FiraMono-Medium.ttf";
      sha256 = "a5bc1a2db2f65946049de615ecc08603d788eb0c02b520f4ed95f05a5cc58532";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/22d9fb782d20f88fc9952807408d0e56739cc43a/ofl/firamono/FiraMono-Bold.ttf?raw=true";
      name = "FiraMono-Bold.ttf";
      sha256 = "61f0ca3ae72a83deb807040f314e1b8b4e40b08213df243db9fd430095cab305";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FiraMono-Regular.ttf $out/share/fonts/truetype/FiraMono-Regular.ttf
     install -Dm644 FiraMono-Medium.ttf $out/share/fonts/truetype/FiraMono-Medium.ttf
     install -Dm644 FiraMono-Bold.ttf $out/share/fonts/truetype/FiraMono-Bold.ttf
  '';

  meta = with lib; {
    description = "Fira Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
