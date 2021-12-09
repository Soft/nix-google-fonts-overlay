{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bentham-${version}";
  version = "2017-08-07-195417";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e933f27bc3d27d51d0b455d1b50b399796fa72a/ofl/bentham/Bentham-Regular.ttf?raw=true";
      name = "Bentham-Regular.ttf";
      sha256 = "6b5d6ac11b4902fc6912c3afb99520e290f59a56245228ca7529fe3937cba793";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bentham-Regular.ttf $out/share/fonts/truetype/Bentham-Regular.ttf
  '';

  meta = with lib; {
    description = "Bentham";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
