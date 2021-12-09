{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nova-script-${version}";
  version = "2017-05-08-223331";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a9ad19397935dc1afbc7fd5ae112f6c5d1dd7bea/ofl/novascript/NovaScript-Regular.ttf?raw=true";
      name = "NovaScript-Regular.ttf";
      sha256 = "470a4b2ca317b49f8bfc21d2b8f70d506b2652643664e1c3898852e72122a28d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NovaScript-Regular.ttf $out/share/fonts/truetype/NovaScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Nova Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
