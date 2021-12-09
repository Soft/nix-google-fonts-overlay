{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wire-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/57dac512dac3c0837fde4455c02fbc818a8ac927/ofl/wireone/WireOne.ttf?raw=true";
      name = "WireOne.ttf";
      sha256 = "a4b6c6a7e69f2d9b668443802db8d01d98f039fa728fddeaf79d73b3105e2364";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WireOne.ttf $out/share/fonts/truetype/WireOne.ttf
  '';

  meta = with lib; {
    description = "Wire One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
