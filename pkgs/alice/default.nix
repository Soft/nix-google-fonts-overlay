{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alice-${version}";
  version = "2017-01-17-072759";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/47a80825906263bc7ff9bc3796a84a146584142d/ofl/alice/Alice-Regular.ttf?raw=true";
      name = "Alice-Regular.ttf";
      sha256 = "26f43e1bf6e88ae87c6fcd30197af8a04574862b5a8cc7c171d28bff33c7ace4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Alice-Regular.ttf $out/share/fonts/truetype/Alice-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Alice";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
