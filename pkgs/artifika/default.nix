{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "artifika-${version}";
  version = "2017-08-07-200429";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1bccb2195ba803a9e047522cf7a928c09fd8b0e6/ofl/artifika/Artifika-Regular.ttf?raw=true";
      name = "Artifika-Regular.ttf";
      sha256 = "da37bc8fc80447c7e6c7a6a0e6f8ecd05e8bdd59a933d0a176786a4678c1e23c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Artifika-Regular.ttf $out/share/fonts/truetype/Artifika-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Artifika";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
