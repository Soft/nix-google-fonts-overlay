{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stalinist-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1105584a417600c42d16205703ea94c0c54919af/ofl/stalinistone/StalinistOne-Regular.ttf?raw=true";
      name = "StalinistOne-Regular.ttf";
      sha256 = "aac596921145cfda888b40da0498700bb62b139c5f45e9fb584c6095dfe8069d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 StalinistOne-Regular.ttf $out/share/fonts/truetype/StalinistOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Stalinist One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
