{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ubuntu-condensed-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/600aba4483e594f8227e30a6186b186d48131c26/ufl/ubuntucondensed/UbuntuCondensed-Regular.ttf?raw=true";
      name = "UbuntuCondensed-Regular.ttf";
      sha256 = "6c1f68d2e85832feae9ea30d2a6c0ea71ea623e8ea342bf00a414f6493ccf720";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 UbuntuCondensed-Regular.ttf $out/share/fonts/truetype/UbuntuCondensed-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Ubuntu Condensed";
    license = licenses.ufl;
    platforms = platforms.all;
  };
}
