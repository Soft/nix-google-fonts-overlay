{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "coming-soon-${version}";
  version = "2017-08-07-204454";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/58e6b444409f33b0aaa157622832c68be2f23af9/apache/comingsoon/ComingSoon-Regular.ttf?raw=true";
      name = "ComingSoon-Regular.ttf";
      sha256 = "0fa985cc8a627b9c25b5d31bb6cbb98aa5b0a630f33b40bd0f6cf93fa3aaf8cc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ComingSoon-Regular.ttf $out/share/fonts/truetype/ComingSoon-Regular.ttf
  '';

  meta = with lib; {
    description = "Coming Soon";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
