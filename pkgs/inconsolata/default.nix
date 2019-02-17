{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inconsolata-${version}";
  version = "2017-05-01-173122";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/efcbdc5d93ada0d4f9fa83389aba7cdbc797606f/ofl/inconsolata/Inconsolata-Regular.ttf?raw=true";
      name = "Inconsolata-Regular.ttf";
      sha256 = "2a53b53d55363c4913a8873d0e1636d6c09d8a3c38570fb166fc71a5123ec8dc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/efcbdc5d93ada0d4f9fa83389aba7cdbc797606f/ofl/inconsolata/Inconsolata-Bold.ttf?raw=true";
      name = "Inconsolata-Bold.ttf";
      sha256 = "76a242626e1c791b6945060d7a61b5b61f6f1c6b364b6c7868a30af1ef44b623";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Inconsolata-Regular.ttf $out/share/fonts/truetype/Inconsolata-Regular.ttf
     install -Dm644 Inconsolata-Bold.ttf $out/share/fonts/truetype/Inconsolata-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Inconsolata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
