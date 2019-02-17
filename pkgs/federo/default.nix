{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "federo-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/federo/Federo-Regular.ttf?raw=true";
      name = "Federo-Regular.ttf";
      sha256 = "5284628c38309ec5046a6bf231e038eaf84c46df03602690607af56cac2b9bc7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Federo-Regular.ttf $out/share/fonts/truetype/Federo-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Federo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
