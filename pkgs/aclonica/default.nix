{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aclonica-${version}";
  version = "2017-05-01-172603";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/25a9400f09fb3dde55dd677516cc1fadcf9d477e/apache/aclonica/Aclonica-Regular.ttf?raw=true";
      name = "Aclonica-Regular.ttf";
      sha256 = "774a49351cc62a469b56972e9769679ce818a3de15b409ad5f1b6244ee84d85b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Aclonica-Regular.ttf $out/share/fonts/truetype/Aclonica-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Aclonica";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
